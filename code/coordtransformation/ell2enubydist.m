function [xEast, yNorth, zUp, xEast0, yNorth0, zUp0, idx]=ell2enubydist(lon,lat,h,lon0,lat0,h0,resmax,distance,a,ecc)
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
[xo,yo,zo]=ell2cart(lon0,lat0,h0,a,ecc);

% Cartesian coordinate at ellipsoid surface
[X0,Y0,Z0]=ell2cart(lon,lat,zeros(size(h)),a,ecc);

% Find arrays in certain distance of computation
idx=find(sqrt((X0-xo).^2+(Y0-yo).^2) <= distance);

% Cartesian coordinate of topography points in certain distance
[X,Y,Z]=ell2cart(lon(idx),lat(idx),h(idx),a,ecc);

clear lon lat h

% Offset vector from local system origin, rotated from ECEF to ENU.
[xEast0,yNorth0,zUp0]=cart2enuformula(X0(idx)-xo,Y0(idx)-yo,Z0(idx)-zo,lon0,lat0);
clear cart2enuformula
clear X0 Y0 Z0

[xEast,yNorth,zUp]=cart2enuformula(X-xo,Y-yo,Z-zo,lon0,lat0);
clear cart2enuformula