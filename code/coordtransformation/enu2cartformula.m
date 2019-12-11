function [x,y,z] = enu2cartformula (e,n,u,lon0,lat0,h0,a,ecc)

[x0,y0,z0]=ell2cart(lon0,lat0,h0,a,ecc);

M = cart2enuRotationMatrix(lat0,lon0);

P=zeros(3,numel(e));
P(1,:)=reshape(e,[1,numel(e)]);
P(2,:)=reshape(n,[1,numel(n)]);
P(3,:)=reshape(u,[1,numel(u)]);

cart = M' * P;

inputsize = size(e);
x = reshape(cart(1,:),inputsize) + x0;
y = reshape(cart(2,:),inputsize) + y0;
z = reshape(cart(3,:),inputsize) + z0;