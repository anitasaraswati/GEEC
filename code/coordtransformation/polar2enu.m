function [xEast, yNorth, zUp]=polar2enu(lon,lat,R,lon0,lat0,h0,a,ecc)
% ell2enu convert geodetic coordinate to local cartesian ENU
%
%   [xEast, yNorth, zUp] = ell2enu(lon, lat, h, lon0, lat0, h0, a, ecc)
%   transforms point locations from geodetic coordinates (lon, lat, h) to
%   local Cartesian coordinates (xEast, yNorth, zUp), given a local
%   coordinate system defined by the geodetic coordinates of its origin
%   (lon0, lat0, h0).  The geodetic coordinates refer to the reference body
%   specified by the spheroid object, semimajor axis a and eccentricity e.
%   Ellipsoidal heights h and h0 must be expressed in the same length unit
%   as the spheroid.  Outputs xEast, yNorth, and zUp will be expressed in
%   this unit, also. The input latitude and longitude angles are in degrees
%   by default.

[X,Y,Z] = polar2cart(lon,lat,R,a,ecc);

[X0,Y0,Z0]=ell2cart(lon0,lat0,h0,a,ecc);

dx=X-X0;
dy=Y-Y0;
dz=Z-Z0;

clear X Y Z X0 Y0 Z0

% Offset vector from local system origin, rotated from ECEF to ENU.
[xEast,yNorth,zUp]=cart2enuformula(dx,dy,dz,lon0,lat0);
