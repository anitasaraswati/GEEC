function [gx,gy,gz] = graviface(Nf,nsides,Edge,Nedges,Face,cor,Un,dens)
% Computes the gravity
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
%% Find solid anglegravi W subtended by face f at opt
dp1=dot(crs1,Un,2);
dp=abs(dp1);
Omega=zeros(Nf,1);
Omega(dp==0)=0;

W1=zeros(Nf,nsides);
for t=1:nsides
    p1=cor(cors(:,idx(t)),:);
    p2=cor(cors(:,idx(t+1)),:);
    p3=cor(cors(:,idx(t+2)),:);
    W1(:,t)=anglegravi(p1,p2,p3,Un);
end
W=sum(W1,2);
W=W-(nsides-2)*pi;
Omega=-fsign.*W;

clear W W1

p1=crs;
p2=cor(icors2,:);

I2=zeros(Nedges,1);
PQR=zeros(Nf,nsides);

chsgn=ones(Nedges,1);
np1=sqrt(sum(abs(p1).^2,2));
np2=sqrt(sum(abs(p2).^2,2));
c1=dot(p1,p2,2)./(np1.*np2)==1;
c2=np1>np2;
chsgn(c1&c2,:)=-1;
p1(c1&c2,:)=p2(c1&c2,:);

clear c1 c2

V2=Edge(:,1:3);
L2=Edge(:,4);
LL2=L2.*L2;
b2=2.*dot(V2,p1,2);
r12=np1.*np1;
bb2=b2./L2./2;

rb0=np1+bb2==0;
V2(rb0,:)=-Edge(rb0,1:3);
b2(rb0,:)=2.*dot(V2(rb0,:),p1(rb0,:),2);
bb2(rb0,:)=b2(rb0,:)./L2(rb0,:)./2;
I2(rb0,:)=(1./L2(rb0,:)).*log(abs(L2(rb0,:)-np1(rb0,:))./np1(rb0,:));

rbn0=np1+bb2~=0;
I2(rbn0,:)=(1./L2(rbn0,:)).*log ((sqrt(LL2(rbn0,:) + b2(rbn0,:) + ...
    r12(rbn0,:))+L2(rbn0,:)+bb2(rbn0,:))./(np1(rbn0,:) + bb2(rbn0,:)));
I2=I2.*chsgn;
i0= L2==0; I2(i0)=0;
pqr2=[I2 I2 I2].*V2;

for j=1:nsides
    tpqr(j,:)=reshape((pqr2(icrs(:,j),:))',1,[]);
end
PQR=reshape(sum(tpqr,1),[3, Nf])';

% From Omega,l,m,n,PQR, get components of field due to face f
l=Un(:,1);
m=Un(:,2);
n=Un(:,3);
p=PQR(:,1);
q=PQR(:,2);
r=PQR(:,3);

% since g=G.m/(r*r), avoid g==infinity if r==0
% calculate gravity in mGal unit

dpn0=find(dp~=0);
dp0=find(dp==0);

gx = -dens.*Gc.*dp1.*(l.*Omega+n.*q-m.* r);
gy = -dens.*Gc.*dp1.*(m.*Omega+l.*r-n.* p);
gz = -dens.*Gc.*dp1.*(n.*Omega+m.*p-l.* q);

gx(dp0)=0;
gy(dp0)=0;
gz(dp0)=0;

%% coordinate transformation
gx=sum(gx).*1e5;
gy=sum(gy).*1e5;
gz=sum(gz).*1e5;

end

