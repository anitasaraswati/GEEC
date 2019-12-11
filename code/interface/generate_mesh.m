function [point,tri,ha]=generate_mesh(modelgeo,lonmes,latmes,meshdist,a,ecc)
% transform geographic coordinates to local ENU
[point(:,1),point(:,2),point(:,3)]=ell2enu(modelgeo(:,1),modelgeo(:,2),modelgeo(:,3),lonmes,latmes,0,a,ecc);

%% create the mesh
all_lat=min(modelgeo(:,2))==-90 & max(modelgeo(:,2))==90;

if all_lat==1
    [X,Y,Z]=ell2cart(modelgeo(:,1),modelgeo(:,2),modelgeo(:,3)*0,a,ecc);
    k1=convhull(X,Y,Z);
    clear X Y Z
else    
    k1=delaunay(point(:,1),point(:,2));
end


%% geographic to ENU transformation by certain distance of dem lower resolution
if meshdist<180
    if meshdist~=0
        if numel(modelgeo(:,1))>160000000
            nindice=numel(modelgeo(:,1));
            hindice=ceil(nindice/2);
            [dist(1:hindice),az(1:hindice)] = distance(latmes,lonmes,modelgeo(1:hindice,2),modelgeo(1:hindice,1));
            [dist(hindice+1:nindice),az(hindice+1:nindice)] = distance(latmes,lonmes,modelgeo(hindice+1:nindice,2),modelgeo(hindice+1:nindice,1));
            dist=dist';
            az=az';
        else
            [dist,az] = distance(latmes,lonmes,modelgeo(:,2),modelgeo(:,1));
        end
        idxdist=find(dist<=meshdist);
    end
    
    %% remove the triangulation outside the desired area
    tri=k1;
    ik=sum(ismember(k1,idxdist),2);
    c = ik>=2;
    tri=tri(c,:);    
else
    tri=k1;    
end

ha=modelgeo(:,3);