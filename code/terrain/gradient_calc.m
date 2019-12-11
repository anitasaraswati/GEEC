function calcres = gradient_calc(Emes,Nmes,Umes,point,tri,dens)
% Computes gravity gradients
txx=0;
txy=0;
txz=0;
tyy=0;
tyz=0;
tzz=0;
gx=0;
gy=0;
gz=0;

if isempty(tri)==0    
    nsides=size(tri,2);
    Facetop=[nsides*ones(size(tri,1),1) tri];
    [Gx,Gy,Gz,Txx,Txy,Txz,Tyy,Tyz,Tzz]=...
        gradientcalc(Emes,Nmes,Umes,point,Facetop,dens);
    gx=real(Gx);
    gy=real(Gy);
    gz=real(Gz);
    txx=real(Txx);
    txy=real(Txy);
    txz=real(Txz);
    tyy=real(Tyy);
    tyz=real(Tyz);    
    tzz=real(Tzz);
end
%
calcres = [gx,gy,gz,txx,txy,txz,tyy,tyz,tzz];

clear Face*;