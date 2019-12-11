function [dx,dy,dz]=cartoffsetgeocentricdist(lon,lat,h,lon0,lat0,h0,a,ecc)

[X,Y,Z]=ell2cart(lon,lat,0,a+h,ecc);
[X0,Y0,Z0]=ell2cart(lon0,lat0,h0,a,ecc);

dx=X-X0;
dy=Y-Y0;
dz=Z-Z0;