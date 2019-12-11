function [e,n,u]=cart2enuformula(dx,dy,dz,lambda0,phi0)

% Each column of P is a 3-vectors oriented relative to the geocentric
% system.
% P=zeros(3,numel(dx));
% P(1,:)=reshape(dx,[1,numel(dx)]);
% P(2,:)=reshape(dy,[1,numel(dy)]);
% P(3,:)=reshape(dz,[1,numel(dz)]);
P=[dx';dy';dz'];
sized=size(dx);
clear dx dy dz
% Construct a rotation matrix M that rotates cartesian vectors from
% geocentric to local vertical ENU.
M = cart2enuRotationMatrix(phi0,lambda0);

% Rotate each column of P into the local ENU system
ENU = M * P;

% Extract and reshape a coordinate array for each axis east,north,up
e=reshape(ENU(1,:),sized);
n=reshape(ENU(2,:),sized);
u=reshape(ENU(3,:),sized);
