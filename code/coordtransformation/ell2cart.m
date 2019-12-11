function [X,Y,Z] = ell2cart(lam0,phi0,h,a,ecc)
% from ellipsoidal to Cartesian

% eccentricity squared
e2 = ecc^2;
% phi and lam from degrees to radians
phi0 = deg2rad(phi0);
lam0 = deg2rad(lam0);
% N
N = a./sqrt(1-e2*sin(phi0).^2);
X = (N+h).*(cos(phi0).*cos(lam0));
Y = (N+h).*(cos(phi0).*sin(lam0));
Z = (N.*(1-e2)+h).*sin(phi0);