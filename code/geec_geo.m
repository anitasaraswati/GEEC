function R = geec_geo(coord_calc,mass_model,tri,dens,vdatum,a,ecc,Gcalc)
%%
% GEEC function to calculate the gravitational fields of a polyhedron body
% INPUT:
% coord_calc : coordinate of the computation point in geographic coordinate [lon lat h]. h is given above reference ellipsoid
% mass_model : vertice of the polyehdron in geographic coordinate [lon lat h]
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

% break down the computation position
lonmes=coord_calc(:,1);
latmes=coord_calc(:,2);
zmes=coord_calc(:,3);
clear coord_calc

% determine the function of computation
if strcmp(Gcalc,'grad')
    f = @gradient_calc;
elseif strcmp(Gcalc,'grav')
    f = @gravity_calc;
else
    disp('Option calc is not correct')
    return;
end

% if the tri was not defined, create it
if isempty(tri)
    [X,Y,Z]=ell2cart(mass_model(:,1),mass_model(:,2),mass_model(:,3),a,ecc);
    tri=convhull(X,Y,Z);
    clear X Y Z    
end

% define the vertical datum of each point
if strcmp(vdatum,'geoid')
    [geoid, geoidrefvec] = egm96geoid(1);
    geoh = ltln2val(geoid, geoidrefvec,mass_model(:,2),mass_model(:,1));
else
    geoh=zeros(size(mass_model(:,1)));
end

% calculation
hbar = parfor_progressbar(numel(lonmes),'Please wait...'); %create the progress bar 
parfor i=1:numel(lonmes)
     R(i,:)=geec_calc(mass_model,geoh,lonmes(i),latmes(i),zmes(i),a,ecc,f,tri,dens);
     hbar.iterate(1);
     %parsave(m,i,calcres(i,:));
end
close(hbar);
end
