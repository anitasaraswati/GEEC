function[gx,gy,gz]=gravicalc(X,Y,Z,Corner,Face,dens)
%% Calculates gravity field acceleration in mGal
%%
Ncor=size(Corner,1);
Nf=size(Face,1);
format long;
%% Get edgelengths
Nedges=sum(Face(1:Nf,1));
Edge=zeros(Nedges,8);
Un=zeros(Nf,3);

gx=zeros(size(X));
gy=gx;
gz=gx;
cor=zeros(Ncor,3);

if Nf~=0
    nsides=Face(1,1);
    indx=[Face(:,2:nsides+1) Face(:,2)]; 

    ends=[reshape(indx(:,1:nsides)',[numel(indx(:,1:nsides)) 1]) reshape(indx(:,2:nsides+1)',[numel(indx(:,2:nsides+1)) 1])];
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
    Un(nss==0,:)=ss(nss==0,:);
    Un(nss~=0,:)=ss(nss~=0,:)./[nss(nss~=0) nss(nss~=0) nss(nss~=0)];
    
    clear indx ends p1 p2 V L v1 v2 ss nss 
    
    opt=[X Y Z];
    for t=1:numel(opt)
        cor(:,t) = Corner(:,t)-opt(t);
    end;
    [gx,gy,gz] = graviface(Nf,nsides,Edge,Nedges,Face,cor,Un,dens);
    clear graviface;
end

return;
