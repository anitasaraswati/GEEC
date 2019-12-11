function R = geec_topo(coord_calc,dem,tri,vdatum,a,ecc,Gcalc,extension)
%%
% geec function to calculate the gravitational fields of topography
% INPUT:
% coord_calc : coordinate of the computation point in geographic coordinate [lon lat h]. h is given above reference ellipsoid
% dem : vertice of the polyehdron in geographic coordinate [lon lat h]
% tri : the triangle mesh of the polyhedron
% dens : density of the mass (in kg.m-3)
% vdatum : vertical datum of the mass model ('geoid' or 'ellipsoid')
% a : major axis of the reference ellipsoid (in meter)
% ecc : eccentricity of the reference ellipsoid
% Gcalc : the option of the calculation ('grav' for gravity or 'grad' for gravity gradient)
% OUTPUT:
% R : results of the computation, consists of coordinate of the point and the results (full tensor of gravity and/or gravity gradients)
% -------------------------------------------------------------------------
% license:
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the  Free  Software  Foundation; either version 3 of the License, or
%    (at your option) any later version.
%  
%    This  program is distributed in the hope that it will be useful, but 
%    WITHOUT   ANY   WARRANTY;  without  even  the  implied  warranty  of 
%    MERCHANTABILITY  or  FITNESS  FOR  A  PARTICULAR  PURPOSE.  See  the
%    GNU General Public License for more details.
%  
%    You  should  have  received a copy of the GNU General Public License
%    along with Octave; see the file COPYING.  
%    If not, see <http://www.gnu.org/licenses/>.
% -------------------------------------------------------------------------
%%

% if the value of the extension is not given, define to global
if nargin<8
    extension=180;
end

% break down the computation position
lonmes=coord_calc(:,1);
latmes=coord_calc(:,2);
zmes=coord_calc(:,3);
clear coord_calc

% determine the function of computation
if strcmp(Gcalc,'grad')
    f = @gradient_calc_topo;
elseif strcmp(Gcalc,'grav')
    f = @gravity_calc_topo;
else
    disp('Option calc is not correct')
    return;
end

% make sure if the input is unique
lon=dem(:,1);
lat=dem(:,2);
if min(lon)+360 == max(lon)
    mlon=min(lon);
    lon(lon==mlon)=max(lon);
    clearvars mlon;
end
ipole= lat==90 | lat==-90;
lon(ipole)=0;
[~,ia,~]=unique([lon lat],'rows','stable');
dem=dem(ia,:);
clearvars lon lat ipole ia

% define the vertical datum of each point
if strcmp(vdatum,'geoid')
    [geoid, geoidrefvec] = egm96geoid(1);
    geoh = ltln2val(geoid, geoidrefvec,dem(:,2),dem(:,1));
else
    geoh=zeros(size(dem(:,1)));
end

% check the coverage of given DEM
all_lon_c1=min(dem(:,1))==-180 & max(dem(:,1))==180;
all_lon_c2=min(dem(:,1))==0 & max(dem(:,1))==360;
all_lat=min(dem(:,2))==-90 & max(dem(:,2))==90;
if (all_lon_c1 && all_lat) || (all_lon_c2 && all_lat)
    % create the triangle mesh if it is not given
    if isempty(tri)
        [X,Y,Z]=ell2cart(dem(:,1),dem(:,2),zeros(size(dem(:,3))),a,ecc);
        tri=convhull(X,Y,Z);
        clear X Y Z
    end
else
    % create the triangle mesh if it is not given
    lon0=mean(lonmes);
    lat0=mean(latmes);
    if isempty(tri)
        [e,n,u]=ell2enu(dem(:,1),dem(:,2),dem(:,3),lon0,lat0,0,a,ecc);
        tri=delaunay(e,n);       
        clear e n u
    end
end

% separating land and water part
[iland,iwater,tri1,tri3] = separate_water_land(tri,dem);

% calculation 
hbar = parfor_progressbar(numel(lonmes),'Please wait...'); %create the progress bar 
parfor i=1:numel(lonmes)
      R(i,:)=geec_topocalc(dem,geoh,lonmes(i),latmes(i),zmes(i),extension,a,ecc,f,tri,iland,iwater,tri1,tri3);
      hbar.iterate(1);
     %parsave(m,i,calcres(i,:));
end
close(hbar);

end
