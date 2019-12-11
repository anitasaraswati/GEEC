% GEEC function to calculate the gravitational effect of a mass body in the planar field
% point: point cloud to define the geometry of the mass body
% Xmes: position of the computation point in X-direction
% Ymes: position of the computation point in Y-direction
% Zmes: position of the computation point in Z-direction
% f: the defined function of the calculation
% tri: triangulation of the model geometry
% dens: density of the mass

function R = geec_calc_flat(point,Xmes,Ymes,Zmes,f,tri,dens)

    calcres=f(Xmes,Ymes,Zmes,point,tri,dens);
    clear f
    
    R=[Xmes Ymes Zmes calcres];
end
