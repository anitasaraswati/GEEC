% get grid properties
getcomp_points;
if strcmp(gridoption,'rb_grid')
    lonmes=west+((east-west)/2);
    latmes=south+((north-south)/2);
elseif strcmp(gridoption,'rb_fromfile')
    midpoint=mean(coord_calc,1);
    lonmes=midpoint(1);
    latmes=midpoint(2);
    altmes=midpoint(3);
end
% get mesh parameters
get_topotrunc;
% get ellipsoid reference
getellipparameter;
% load model file
loadmodelfile;
loadmeshfile;
% get geometry unit
masstype=get(get(handles.bg_mass_body,'SelectedObject'),'Tag');
cunit=get(get(handles.bg_unit,'SelectedObject'),'Tag');

% create mesh and plot
if strcmp(masstype,'rb_topo')
    if isempty(tri)
        if strcmp(cunit,'rb_deg')
            [point,tri,ha]=generate_mesh(modelgeo,lonmes,latmes,extension,a,ecc);
        end
    else
        if strcmp(cunit,'rb_deg')
            [point(:,1),point(:,2),point(:,3)]=ell2enu(modelgeo(:,1),modelgeo(:,2),modelgeo(:,3),lonmes,latmes,0,a,ecc);
            ha=modelgeo(:,3);
        end
    end
else
    if isempty(tri)
        if strcmp(cunit,'rb_deg')
            [X,Y,Z]=ell2cart(modelgeo(:,1),modelgeo(:,2),modelgeo(:,3),a,ecc);
            tri=convhull(X,Y,Z);
            clear X Y Z
            point=modelgeo;
            ha=modelgeo(:,3);
        else                    
            tri=convhull(modelgeo(:,1),modelgeo(:,2),modelgeo(:,3));
            point=modelgeo;
            ha=modelgeo(:,3);
        end
    else
%        if strcmp(cunit,'rb_deg')
            point=modelgeo;
            ha=modelgeo(:,3);
%        end
    end
end


% plot mesh
figure('Name','Example of mesh');
if strcmp(cunit,'rb_deg')
    trisurf(tri,point(:,1)/1e3,point(:,2)/1e3,point(:,3)/1e3,ha/1e3);
    xlabel('East (km)');
    ylabel('North (km)');
    zlabel('Up (km)');    
    h=colorbar;
    ylabel(h,'Elevation (km)');
else
    trisurf(tri,modelgeo(:,1),modelgeo(:,2),modelgeo(:,3),ha);
    xlabel('X (m)');
    ylabel('Y (m)');
    zlabel('Z (m)');    
    h=colorbar;
    ylabel(h,'Elevation (m)');
end
set(gca,'DataAspectRatio',[1 1 1])
view(3)
clear point ha tri