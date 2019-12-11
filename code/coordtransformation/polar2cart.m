function [X,Y,Z] = polar2cart(lam0,phi0,R,a,ecc)
% from ellipsoidal to Cartesian

% eccentricity squared
e2 = ecc^2;
% phi and lam from degrees to radians
phi0 = deg2rad(phi0);
lam0 = deg2rad(lam0);
% N
X = R.*(cos(phi0).*cos(lam0));
Y = R.*(cos(phi0).*sin(lam0));
Z = R.*sin(phi0);
