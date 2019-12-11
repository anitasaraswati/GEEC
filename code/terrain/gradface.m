function [gx,gy,gz,txx,txy,txz,tyy,tyz,tzz] = gradface(Nf,nsides,Edge,Nedges,Face,cor,Un,dens)
% Computes the gravity gradient
% Reference computation method: Singh and Guptasarma (2001)
%% Universal Gravitational constant.
Gc= 6.67408e-11; 
%%
cors=Face(:,2:end);
cors2=circshift(cors,-1,2);
icors=reshape(cors',[], 1);
icors2=reshape(cors2',[],1);
idx=[1:nsides 1 2];
crs=cor(icors,:);
icrs=reshape(1:Nf*nsides,[nsides Nf])';
crs1=cor(cors(:,1),:);
%% Find if the face is seen from inside
fsign=sign(dot(Un,crs1,2));
fsign(fsign==0)=-1; % change if the P is parallel with facet-i
%% Find solid anglegravi W subtended by face f at opt
dp1=dot(crs1,Un,2);
dp=abs(dp1);
Omega=zeros(Nf,1);
Ox=Omega; Oy=Ox; Oz=Ox;
Omega(dp==0)=0;

W1=zeros(Nf,nsides);
Wx1=W1; Wy1=W1; Wz1=W1;
for t=1:nsides
    p1=cor(cors(:,idx(t)),:);
    p2=cor(cors(:,idx(t+1)),:);
    p3=cor(cors(:,idx(t+2)),:);
    [ang, angx, angy, angz, perp]=anglegrad(p1,p2,p3,Un);
    W1(:,t)=ang;
    Wx1(:,t)=angx;
    Wy1(:,t)=angy;
    Wz1(:,t)=angz;
end
W=sum(W1,2);
Wx=sum(Wx1,2); Wy=sum(Wy1,2); Wz=sum(Wz1,2);
W=W-(nsides-2)*pi;

Omega=-fsign.*W;
Ox=-fsign.*Wx;
Oy=-fsign.*Wy;
Oz=-fsign.*Wz;
clear W W1 Wx Wy Wz Wx1 Wy1 Wz1

%% line integral
p1=crs;
p2=cor(icors2,:);

I2=zeros(Nedges,1);
dix=I2; diy=I2; diz=I2; t=I2;
dtx=I2; dty=I2; dtz=I2;
PQR=zeros(Nf,nsides); PQRx=PQR; PQRy=PQR; PQRz=PQR;

chsgn=ones(Nedges,1);
np1=sqrt(sum(abs(p1).^2,2));
np2=sqrt(sum(abs(p2).^2,2));
c1=(dot(p1,p2,2)./(np1.*np2)==1) & (np1>np2);
chsgn(c1,:)=-1;
p1(c1,:)=p2(c1,:);
np1=sqrt(sum(abs(p1).^2,2));

clear c1 c2

% derivative
dnp1x=-p1(:,1)./np1; dnp1y=-p1(:,2)./np1; dnp1z=-p1(:,3)./np1; 
dr12x=2.*np1.*dnp1x; dr12y=2.*np1.*dnp1y; dr12z=2.*np1.*dnp1z;

% -----------------------------
V2=Edge(:,1:3);
L2=Edge(:,4);
LL2=L2.*L2;
b2=2.*dot(V2,p1,2);
r12=np1.*np1;
bb2=b2./L2./2;

% -----------------------------
matlab_prec=eps(np1);
rb0=abs(np1+bb2)<=abs(matlab_prec);
V2(rb0,:)=-Edge(rb0,1:3);
b2=2.*dot(V2,p1,2);
bb2=sum(V2.*p1,2)./L2;
u=abs(L2-np1);
v=np1;
I2(rb0,:)=(1./L2(rb0,:)).*log(u(rb0,:)./v(rb0,:));

% partial derivative
dux=(L2-np1)./u.*dnp1x*-1;
duy=(L2-np1)./u.*dnp1y*-1;
duz=(L2-np1)./u.*dnp1z*-1;
dvx=dnp1x; dvy=dnp1y; dvz=dnp1z;
dtx=((dux.*v)-(dvx.*u))./(v.^2);
dty=((duy.*v)-(dvy.*u))./(v.^2);
dtz=((duz.*v)-(dvz.*u))./(v.^2);
dix(rb0,:)=1./L2(rb0,:).*(v(rb0,:)./u(rb0,:)).*dtx(rb0,:); 
diy(rb0,:)=1./L2(rb0,:).*(v(rb0,:)./u(rb0,:)).*dty(rb0,:); 
diz(rb0,:)=1./L2(rb0,:).*(v(rb0,:)./u(rb0,:)).*dtz(rb0,:); 

clear dux duy duz dvx dvy dvz dtx dty dtz

% ----------------------------------
rbn0=abs(np1+bb2)>abs(matlab_prec);
u=sqrt(LL2 + b2 + r12)+L2+bb2;
v=np1+bb2;
t(rbn0,:)=u(rbn0,:)./v(rbn0,:);
I2(rbn0,:)=(1./L2(rbn0,:)).*log ((sqrt(LL2(rbn0,:) + b2(rbn0,:) + r12(rbn0,:))+L2(rbn0,:)+bb2(rbn0,:))./(np1(rbn0,:)+bb2(rbn0,:)));

% partial derivative
dbx=-2*V2(:,1); dby=-2*V2(:,2); dbz=-2*V2(:,3); 

dux=(1./2./sqrt(LL2+b2+r12).*(dbx+dr12x))+(1./(2.*L2).*dbx);
duy=(1./2./sqrt(LL2+b2+r12).*(dby+dr12y))+(1./(2.*L2).*dby);
duz=(1./2./sqrt(LL2+b2+r12).*(dbz+dr12z))+(1./(2.*L2).*dbz);
dvx=dnp1x+(1./(2.*L2).*dbx);
dvy=dnp1y+(1./(2.*L2).*dby);
dvz=dnp1z+(1./(2.*L2).*dbz);

dtx(rbn0,:)=((v(rbn0,:).*dux(rbn0,:))-(u(rbn0,:).*dvx(rbn0,:)))./(v(rbn0,:).^2);
dty(rbn0,:)=((v(rbn0,:).*duy(rbn0,:))-(u(rbn0,:).*dvy(rbn0,:)))./(v(rbn0,:).^2);
dtz(rbn0,:)=((v(rbn0,:).*duz(rbn0,:))-(u(rbn0,:).*dvz(rbn0,:)))./(v(rbn0,:).^2);

dix(rbn0,:)=(1./L2(rbn0,:)).*(1./t(rbn0,:)).*dtx(rbn0,:);
diy(rbn0,:)=(1./L2(rbn0,:)).*(1./t(rbn0,:)).*dty(rbn0,:);
diz(rbn0,:)=(1./L2(rbn0,:)).*(1./t(rbn0,:)).*dtz(rbn0,:);

clear dux duy duz dvx dvy dvz dtx dty dtz

% --------------------------
% integrate the result from each edge to the each face
i0= L2==0; 
% if the edge length is 0, change the line integral of that edge to 0
I2(i0)=0;

I2=I2.*chsgn;
pqr2=[I2 I2 I2].*V2;
for j=1:nsides
    tpqr(j,:)=reshape((pqr2(icrs(:,j),:))',1,[]);
end
PQR=reshape(sum(tpqr,1),[3, Nf])';

% partial derivative
% if the edge length is 0, change the line integral of that edge to 0
dix(i0)=0;
diy(i0)=0;
diz(i0)=0;

dix=dix.*chsgn;
diy=diy.*chsgn;
diz=diz.*chsgn;

pqr2x=[dix dix dix].*V2;
pqr2y=[diy diy diy].*V2;
pqr2z=[diz diz diz].*V2;
for j=1:nsides
    tpqrx(j,:)=reshape((pqr2x(icrs(:,j),:))',1,[]);
    tpqry(j,:)=reshape((pqr2y(icrs(:,j),:))',1,[]);
    tpqrz(j,:)=reshape((pqr2z(icrs(:,j),:))',1,[]);
end
PQRx=reshape(sum(tpqrx,1),[3, Nf])';
PQRy=reshape(sum(tpqry,1),[3, Nf])';
PQRz=reshape(sum(tpqrz,1),[3, Nf])';
clear pqr2x tpqrx pqr2y tpqry pqr2z tpqrz

% evaluate line integral if the computation point is located at any vertex
r0=isinf(PQR) | isnan(PQR);
PQR(r0)=0; PQR(r0)=0;
PQRx(r0)=0; PQRx(r0)=0;
PQRy(r0)=0; PQRy(r0)=0;
PQRz(r0)=0; PQRz(r0)=0;
%%
% From Omega,l,m,n,PQR, get components of field due to face f
l=Un(:,1);
m=Un(:,2);
n=Un(:,3);
p=PQR(:,1);
q=PQR(:,2);
r=PQR(:,3);

px=PQRx(:,1); qx=PQRx(:,2); rx=PQRx(:,3);
py=PQRy(:,1); qy=PQRy(:,2); ry=PQRy(:,3);
pz=PQRz(:,1); qz=PQRz(:,2); rz=PQRz(:,3);

% derivative value
dp1x=-l; dp1y=-m; dp1z=-n;

% since g=G.m/(r*r), avoid g==infinity if r==0
% calculate gravity in mGal unit and gravity gradient in E

dpn0=find(dp~=0);
dp0=find(dp==0);

gx = -dens.*Gc.*dp1.*(l.*Omega+n.*q-m.* r);
gy = -dens.*Gc.*dp1.*(m.*Omega+l.*r-n.* p);
gz = -dens.*Gc.*dp1.*(n.*Omega+m.*p-l.* q);

txx = -dens.*Gc.*(dp1.*(l.*Ox + n.*qx - m.*rx)+ ...
    dp1x.*(l.*Omega+n.*q-m.* r));
txy = -dens.*Gc.*(dp1.*(l.*Oy+n.*qy-m.* ry)+ ...
    dp1y.*(l.*Omega+n.*q-m.* r));
txz = -dens.*Gc.*(dp1.*(n.*Ox+m.*px-l.* qx)+ ...
    dp1x.*(n.*Omega+m.*p-l.* q));

tyy = -dens.*Gc.*(dp1.*(m.*Oy+l.*ry-n.* py)+ ...
    dp1y.*(m.*Omega+l.*r-n.* p));
tyz = -dens.*Gc.*(dp1.*(n.*Oy+m.*py-l.* qy)+ ...
    dp1y.*(n.*Omega+m.*p-l.* q));

tzz = -dens.*Gc.*(dp1.*(n.*Oz+m.*pz-l.* qz)+ ...
    dp1z.*(n.*Omega+m.*p-l.* q));

% sum of the faces of the polyehdron
gx=sum(gx).*1e5;
gy=sum(gy).*1e5;
gz=sum(gz).*1e5;

txx=sum(txx).*1e9;
txy=sum(txy).*1e9;
txz=sum(txz).*1e9;
tyy=sum(tyy).*1e9;
tyz=sum(tyz).*1e9;
tzz=sum(tzz).*1e9;

end

