function [Emes,Nmes,Umes,point]=createmesh(demlarge,geoh,lonmes,latmes,zmes,a,ecc)
%% Transform coordinate of measurement point from ellipsoid to ENU
[Emes,Nmes,Umes]=ell2enu(lonmes,latmes,zmes,lonmes,latmes,zmes,a,ecc);

[point(:,1),point(:,2),point(:,3)]=ell2enu(demlarge(:,1),demlarge(:,2),demlarge(:,3)+geoh,lonmes,latmes,zmes,a,ecc);