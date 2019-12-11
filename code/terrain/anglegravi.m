function[ang, perp]=anglegravi(p1, p2, p3, Un)
% Angle.m finds the angle between planes O-p1-p2 and O-p2-p3, where
% p1,p2,p3 are coordinates of 3 points, taken in ccw order as seen from
% origin O. This is used by grvmag3d for finding the solid angle subtended
% by a polygon at the origin.
% Un is the unit outward normal vector to the polygon.
format long;
inout=sign(sum(Un .* p1, 2)); % Check if face is seen from inside
inoutneg=find(inout<0);
inoutpos=find(inout>0);
inout0=find(inout==0);

% if inout>0 % seen from inside; interchange p1 and p3
pt(inoutpos,:)=p1(inoutpos,:);
p1(inoutpos,:)=p3(inoutpos,:);
p3(inoutpos,:)=pt(inoutpos,:);

n1=cross(p2,p1,2);
n2=cross(p2,p3,2);

norm1=sqrt(sum(abs(n1).^2,2));
norm2=sqrt(sum(abs(n2).^2,2));

nn1=n1./[norm1 norm1 norm1];
nn2=n2./[norm2 norm2 norm2];

perp=sum(p3.*nn1,2);
% sign of perp is -ve if points p1 p2 p3 are in cw order
perp=sign(perp);
r=sum((nn1.* nn2),2);
r(isnan(r))=0;

ang=acos(r);
ang(perp<0,:)=2*pi-ang(perp<0,:);
perp(inout0)=1;

return;