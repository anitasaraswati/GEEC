function [xEast, yNorth, zUp]=ell2enundist(lon,lat,h,lon0,lat0,h0,dist,a,ecc)
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

% Cartesian offset vector from local origin lon0,lat0,h0 to lon,lat,h.
[dx,dy,dz]=cartoffset(lon,lat,h,lon0,lat0,h0,a,ecc);

% Offset vector from local system origin, rotated from ECEF to ENU.
[xEast,yNorth,zUp]=cart2enuformula(dx,dy,dz,lon0,lat0);