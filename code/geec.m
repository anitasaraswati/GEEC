function R = geec(coord_calc,mass_model,tri,dens,Gcalc)
%%
% geec function to calculate the gravitational fields of a polyhedron body in a planar field
% coord_calc : coordinate of the computation point in cartesian coordinate [x y z]
% mass_model : vertice of the polyehdron in cartesian coordinate [x y z]
% tri : the topological connectivity of the polyhedron (e.g. triangle mesh)
% dens : density of the mass (in kg.m-3)
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
xmes=coord_calc(:,1);
ymes=coord_calc(:,2);
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
    tri=convhull(mass_model(:,1),mass_model(:,2),mass_model(:,3));    
end

% calculation
parfor i=1:numel(xmes)
     R(i,:)=geec_calc_flat(mass_model,xmes(i),ymes(i),zmes(i),f,tri,dens); 
     %parsave(m,i,calcres(i,:));
end
end
