function [lon,lat,h] = cart2ell(X,Y,Z,a,ecc)
% From Cartesian to geodetic coordinates using Bowring

e2 = ecc^2;         % eccentricity squared
b = a*sqrt(1-e2);   % semi-minor axis

% Geographic longitude
lon = atan2(Y,X);

% Auxiliary values
p = sqrt(X.^2 + Y.^2);
mu = atan(a*Z./(b*p));
ea2 = e2/(1-e2);

% Geographic latitude
lat = atan2(Z + ea2*b*sin(mu).^3, p - e2*a*cos(mu).^3);

% Height above ellipsoid
h = p./cos(lat) - a./sqrt(1-e2*sin(lat).^2);

% from radians to degrees
lon = rad2deg(lon);
lat = rad2deg(lat);