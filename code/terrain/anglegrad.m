function[ang, angx, angy, angz, perp]=anglegrad(p1, p2, p3, Un)
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
nf=size(Un,1);

% if inout>0 % seen from inside; interchange p1 and p3
pt(inoutpos,:)=p1(inoutpos,:);
p1(inoutpos,:)=p3(inoutpos,:);
p3(inoutpos,:)=pt(inoutpos,:);

n1=cross(p2,p1,2);
n2=cross(p2,p3,2);

norm1=sqrt(sum(abs(n1).^2,2));
norm2=sqrt(sum(abs(n2).^2,2));

dp1x=repmat([-1 0 0],nf,1); dp1y=repmat([0 -1 0],nf,1); dp1z=repmat([0 0 -1],nf,1);
dp2x=repmat([-1 0 0],nf,1); dp2y=repmat([0 -1 0],nf,1); dp2z=repmat([0 0 -1],nf,1);
dp3x=repmat([-1 0 0],nf,1); dp3y=repmat([0 -1 0],nf,1); dp3z=repmat([0 0 -1],nf,1);

dn1x=cross(dp2x,p1,2)+cross(p2,dp1x,2);
dn1y=cross(dp2y,p1,2)+cross(p2,dp1y,2);
dn1z=cross(dp2z,p1,2)+cross(p2,dp1z,2);

dn2x=(cross(dp2x,p3,2)+cross(p2,dp3x,2));
dn2y=(cross(dp2y,p3,2)+cross(p2,dp3y,2));
dn2z=(cross(dp2z,p3,2)+cross(p2,dp3z,2));

dnorm1x=sum(n1.*dn1x,2)./norm1;
dnorm1y=sum(n1.*dn1y,2)./norm1;
dnorm1z=sum(n1.*dn1z,2)./norm1;
dnorm2x=sum(n2.*dn2x,2)./norm2;
dnorm2y=sum(n2.*dn2y,2)./norm2;
dnorm2z=sum(n2.*dn2z,2)./norm2;

nn1=n1./[norm1 norm1 norm1];
nn2=n2./[norm2 norm2 norm2];

dnn1x=((repmat(norm1,1,3).*dn1x)-(n1.*repmat(dnorm1x,1,3)))./repmat((norm1.^2),1,3);
dnn1y=((repmat(norm1,1,3).*dn1y)-(n1.*repmat(dnorm1y,1,3)))./repmat((norm1.^2),1,3);
dnn1z=((repmat(norm1,1,3).*dn1z)-(n1.*repmat(dnorm1z,1,3)))./repmat((norm1.^2),1,3);
dnn2x=((repmat(norm2,1,3).*dn2x)-(n2.*repmat(dnorm2x,1,3)))./repmat((norm2.^2),1,3);
dnn2y=((repmat(norm2,1,3).*dn2y)-(n2.*repmat(dnorm2y,1,3)))./repmat((norm2.^2),1,3);
dnn2z=((repmat(norm2,1,3).*dn2z)-(n2.*repmat(dnorm2z,1,3)))./repmat((norm2.^2),1,3);

perp=sum(p3.*nn1,2);
% sign of perp is -ve if points p1 p2 p3 are in cw order
perp=sign(perp);
r=sum((nn1.* nn2),2);
r(isnan(r))=0;
% derivative of r
drx=sum((nn1.*dnn2x),2)+sum((dnn1x.*nn2),2);
dry=sum((nn1.*dnn2y),2)+sum((dnn1y.*nn2),2);
drz=sum((nn1.*dnn2z),2)+sum((dnn1z.*nn2),2);

% the solid angle and its partial derivative
ang=acos(r);

angx=-drx./sqrt(1-r.^2);
angy=-dry./sqrt(1-r.^2);
angz=-drz./sqrt(1-r.^2);
i0=sqrt(1-r.^2)==0;
angx(i0)=0; angy(i0)=0; angz(i0)=0; 

ang(isnan(r))=0;
angx(isnan(angx))=0;
angy(isnan(angy))=0;
angz(isnan(angz))=0;

ang(perp<0,:)=(2*pi)-ang(perp<0,:);
perp(inout0)=1;

angx(perp<0,:)=-angx(perp<0,:);
angy(perp<0,:)=-angy(perp<0,:);
angz(perp<0,:)=-angz(perp<0,:);

return;