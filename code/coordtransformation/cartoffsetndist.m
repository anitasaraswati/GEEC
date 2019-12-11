function [dx,dy,dz]=cartoffsetndist(lon,lat,h,lon0,lat0,h0,dist,a,ecc)

[X,Y,Z]=ell2cart(lon,lat,h,a,ecc);
[X0,Y0,Z0]=ell2cart(lon0,lat0,h0,a,ecc);

dx=X-X0;
dy=Y-Y0;
dz=Z-Z0;