function calcres = gravity_calc(Emes,Nmes,Umes,point,tri,dens)
% Computes gravity field acceleration
gx=0;
gy=0;
gz=0;

if isempty(tri)==0
    % top    
    nsides=size(tri,2);
    Facetop=[nsides*ones(size(tri,1),1) tri];
    [Gxtop,Gytop,Gztop]=gravicalc(Emes,Nmes,Umes,point,Facetop,dens);
    gx=real(Gxtop);
    gy=real(Gytop);
    gz=real(Gztop);
end
calcres = [gx,gy,gz];

clear Corner* Face*;