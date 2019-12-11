function [lon,lat,h] = enu2ell(e, n, u, lon0, lat0, h0, a, ecc)

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

% enu2cart
[x,y,z] = enu2cartformula(e,n,u,lon0,lat0,h0,a,ecc);

% cart2ell
[lon,lat,h] = cart2ell(x,y,z,a,ecc);

