function [Emes,Nmes,Umes,point]=createmeshflat(dem,xmes,ymes,zmes)
%% Transform coordinate of measurement point from ellipsoid to ENU
% [Emes,Nmes,Umes]=ell2enu(lonmes,latmes,zmes,lonmes,latmes,zmes,a,ecc);
Emes=lonmes;
Nmes=latmes;
Umes=zmes;
% [point(:,1),point(:,2),point(:,3)]=ell2enu(demlarge(:,1),demlarge(:,2),demlarge(:,3)+geoh,lonmes,latmes,zmes,a,ecc);
point(:,1)=dem(:,1);
point(:,2)=dem(:,2);
point(:,3)=dem(:,3);
