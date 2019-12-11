function [Emes,Nmes,Umes,point0,point1,point2,point3,point4,tri0_land,tri0_water,tri1,tri2,tri3,tri4]=createmesh_topo(dem,geoh,lonmes,latmes,zmes,meshdist,a,ecc,iland,iwater,k0,k1,k3)
%% Transform coordinate of measurement point from ellipsoid to ENU
[Emes,Nmes,Umes]=ell2enu(lonmes,latmes,zmes,lonmes,latmes,zmes,a,ecc);

%% geographic to ENU transformation by certain distance of dem lower resolution
if meshdist<180
    if meshdist~=0
        if numel(dem(:,1))>160000000
            nindice=numel(dem(:,1));
            hindice=ceil(nindice/2);
            [dist(1:hindice),az(1:hindice)] = distance(latmes,lonmes,dem(1:hindice,2),dem(1:hindice,1));
            [dist(hindice+1:nindice),az(hindice+1:nindice)] = distance(latmes,lonmes,dem(hindice+1:nindice,2),dem(hindice+1:nindice,1));
            dist=dist';
            az=az';
        else
            [dist,az] = distance(latmes,lonmes,dem(:,2),dem(:,1));
        end
        idxdist=find(dist<=meshdist);
    end
    
    %% remove the triangulation outside the desired area
    tri1=k1;
    ik=sum(ismember(k1,idxdist),2);
    c = ik>=2;
    tri1=tri1(c,:);
    
    tri3=k3;
    ik=sum(ismember(k3,idxdist),2);
    c = ik>=2;
    tri3=tri3(c,:);
else
    tri1=k1;
    tri3=k3;
end

%% set triangulation
tri0_land=fliplr(tri1);
tri0_water=fliplr(tri3);


%% coordinate transformation
[point0(:,1),point0(:,2),point0(:,3)]=ell2enu(dem(:,1),dem(:,2),geoh,lonmes,latmes,zmes,a,ecc); % rock
% [point0(:,1),point0(:,2),point0(:,3)]=ell2enu(dem(:,1),dem(:,2),dem(:,3)+geoh,lonmes,latmes,zmes,a,ecc); % the others
[point1(:,1),point1(:,2),point1(:,3)]=ell2enu(dem(:,1),dem(:,2),dem(:,3)+geoh,lonmes,latmes,zmes,a,ecc);

point3=point1;

%% divide land and water part
point1(iwater,:)=point0(iwater,:);
point3(iland,:)=point0(iland,:);

%% handle vertical surface
if meshdist<180
    if meshdist<=90
        idxdist=find(dist<=meshdist);
    else
        idxdist=find(dist>=meshdist & dist<=180);
    end
    
    ik=ismember(k0,idxdist);
    sik=sum(ik,2);
    c = sik>=2;
    triedge=k0(c,:);
    clear k0
    pedges=reshape(triedge,[],1);
    pedges(pedges==0)=[];
    oedges=unique(pedges);
   
    warning off;
    if meshdist<180 && size(oedges,1)>2
        
        dt=triangulation(triedge,point0(:,1),point0(:,2));
        fe=freeBoundary(dt);
        iint=[fe(:,1);fe(1)];
        if meshdist>90
            iint=flipud(iint);
        end
        
        point0v=point0(iint,:);
        point1v=point1(iint,:);
        point3v=point1v;
        h=dem(iint,3);
        
        x=[1:numel(iint) 1:numel(iint)];
        y=[ones(1,numel(iint)) zeros(1,numel(iint))];
        tri2=delaunay(x,y);
        tri4=tri2;
        clear x y
        
        iland=find(h>0);
        iwater=find(h<0);
        point1v(iwater,:)=point0v(iwater,:);
        point3v(iland,:)=point0v(iland,:);
        
        point2=[point1v; point0v];
        point4=[point0v; point3v];
        
        d1=ismember(tri2(:,1),iland);
        d2=ismember(tri2(:,2),iland);
        d3=ismember(tri2(:,3),iland);
        dland= d1 | d2 | d3;
        tri2_calc=tri2(dland,:);
        clear tri2;
        tri2=tri2_calc;
        clear tri2_calc;
        
        d1=ismember(tri4(:,1),iwater);
        d2=ismember(tri4(:,2),iwater);
        d3=ismember(tri4(:,3),iwater);
        dwater= d1 | d2 | d3;
        tri4_calc=tri4(dwater,:);
        clear tri4;
        tri4=tri4_calc;
        clear tri4_calc;
    else
        point2=[];
        point4=[];
        tri2=[];
        tri4=[];
    end
else
    point2=[];
    point4=[];
    tri2=[];
    tri4=[];
end