function plotfig(gridoption,lon,lat,xx,xy,xz,yy,yz,zz)
nlon=numel(unique(lon));
nlat=numel(unique(lat));
isprofile=nlon==1 | nlat==1;
if strcmp(gridoption,'rb_grid')==1 && isprofile==0
    tr=delaunay(lon,lat);
end
xlimit=[min(lon) max(lon)];
ylimit=[min(lat) max(lat)];
position=get(0, 'Screensize');
position(1:2)= position(3:4)/4;
position(3:4)= position(3:4)/2;
if nargin==9
    
    figure('Name','Gravity gradient','Position',position);
    colormap('jet');
    valmax=max(max([xx,xy,xz,yy,yz,zz]));
    valmin=min(min([xx,xy,xz,yy,yz,zz]));
    titlelabel={'Txx (E)','Txy (E)','Txz (E)','Tyy (E)','Tyz (E)','Tzz (E)'};
    idxsp=[1,2,3,5,6,9];
    if strcmp(gridoption,'rb_grid')==1 && isprofile==0
        subplot(3,3,1)
        trisurf(tr,lon,lat,xx);
        subplot(3,3,2)
        trisurf(tr,lon,lat,xy);
        subplot(3,3,3)
        trisurf(tr,lon,lat,xz);
        subplot(3,3,5)
        trisurf(tr,lon,lat,yy);
        subplot(3,3,6)
        trisurf(tr,lon,lat,yz);
        subplot(3,3,9)
        trisurf(tr,lon,lat,zz);        
    else
        subplot(3,3,1)
        scatter(lon,lat,20,xx,'filled');
        subplot(3,3,2)
        scatter(lon,lat,20,xy,'filled');
        subplot(3,3,3)
        scatter(lon,lat,20,xz,'filled');
        subplot(3,3,5)
        scatter(lon,lat,20,yy,'filled');
        subplot(3,3,6)
        scatter(lon,lat,20,yz,'filled');
        subplot(3,3,9)
        scatter(lon,lat,20,zz,'filled');
    end
    for i=1:6
        subplot(3,3,idxsp(i));
        view(2);
        shading interp;
        h=colorbar;
        ylabel(h,titlelabel{i});
        xlim(xlimit); ylim(ylimit);
        %xlabel('x (m)'); ylabel('y (m)');
        caxis([valmin, valmax]);
        set(gca,'DataAspectRatio',[10 10 1])
        set(gca,'FontSize',12)
    end
    movegui(gcf,'center')
    
else
    position(4)= position(4)/3;
    figure('Name','Gravity field','Position',position);
    colormap('jet');
    valmax=max(max([xx,xy,xz]));
    valmin=min(min([xx,xy,xz]));
    titlelabel={'gx (mGal)','gy (mGal)','gz (mGal)'};
    if strcmp(gridoption,'rb_grid')==1 && isprofile==0
        subplot(1,3,1)
        trisurf(tr,lon,lat,xx);
        subplot(1,3,2)
        trisurf(tr,lon,lat,xy);
        subplot(1,3,3)
        trisurf(tr,lon,lat,xz);
    else
        subplot(1,3,1)
        scatter(lon,lat,20,xx,'filled');
        subplot(1,3,2)
        scatter(lon,lat,20,xy,'filled');
        subplot(1,3,3)
        scatter(lon,lat,20,xz,'filled');
    end
    for i=1:3
        subplot(1,3,i);
        view(2);
        shading interp;
        h=colorbar;
        ylabel(h,titlelabel{i});
        xlim(xlimit); ylim(ylimit);
        %xlabel('x (m)'); ylabel('y (m)');
        caxis([valmin, valmax]);
        set(gca,'DataAspectRatio',[10 10 1])
        set(gca,'FontSize',12)
    end
    movegui(gcf,'center')
end

end
