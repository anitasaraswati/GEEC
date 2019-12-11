function M = cart2enuRotationMatrix(phi0,lambda0)
% Construct the matrix that rotates Cartesian vectors from geocentric to
% local ENU

sinphi=sind(phi0);
cosphi=cosd(phi0);
sinlambda=sind(lambda0);
coslambda=cosd(lambda0);

M = [ 1   0       0   ; ...
      0 sinphi  cosphi; ...
      0 -cosphi sinphi] ...
  * [-sinlambda  coslambda 0; ...
     -coslambda -sinlambda 0; ...
        0           0      1];
    