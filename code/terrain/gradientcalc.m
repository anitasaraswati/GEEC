function[gx0,gy0,gz0,Txx,Txy,Txz,Tyy,Tyz,Tzz]=gradientcalc(X,Y,Z,Corner,Face,dens)
% Calculates gravity gradients
%%
Nf=size(Face,1);
format long;
%% Get edgelengths
Nedges=sum(Face(1:Nf,1));
Edge=zeros(Nedges,8);
Un=zeros(Nf,3);
%% Calculation
gx0=zeros(size(X)); gy0=gx0; gz0=gx0;
Txx=zeros(size(X));
Tyy=Txx;
Tzz=Txx;
Txy=Txx;
Txz=Txx;
Tyz=Txx;

if Nf~=0
    nsides=Face(1,1);
    indx=[Face(:,2:end) Face(:,2)];
    ends=[reshape(indx(:,1:end-1)',[],1) reshape(indx(:,2:end)',[],1)];
    p1=Corner(ends(:,1),:);
    p2=Corner(ends(:,2),:);
    V=p2-p1;    
    L=sqrt(sum(abs(V).^2,2));
    Edge(:,1:3)=V;
    Edge(:,4)=L;
    Edge(:,7:8)=ends;
    ss=zeros(Nf,3);
    for j=2:nsides-1
        v1=Corner(Face(:,j+2),:)-Corner(Face(:,2),:);
        v2=Corner(Face(:,j+1),:)-Corner(Face(:,2),:);
        ss=ss+cross(v2,v1,2);
    end
    nss=sqrt(sum(abs(ss).^2,2));
    n0=nss~=0;    
    Un(nss==0,:)=0;
    Un(n0,:)=ss(n0,:)./[nss(n0) nss(n0) nss(n0)];
    
    clear indx ends p1 p2 V L v1 v2 ss nss
    
    %% calculate gradient for each face       
    opt=[X Y Z];
    % shift origin
    for t=1:numel(opt)
        cor(:,t) = Corner(:,t)-opt(t);
    end
    [gx0,gy0,gz0,Txx,Txy,Txz,Tyy,Tyz,Tzz] = gradface(Nf,nsides,Edge,Nedges,Face,cor,Un,dens);
    clear gradface;

end
return;