%% examples of script to launch GEEC without GEEC's user interface
startup;
delete(gcp); p=parpool; % for parallel computation, comment if it's not needed
%% Topography effect on gravity field calculated on a grid with no mesh file  (Geographic coordinate system and ellispoid geometry)
% define computation points
[X,Y]=meshgrid([-10:1:10],[-15:1:15]);
lon=X(:);
lat=Y(:);
z=2000*ones(size(lon));
coord_calc=[lon,lat,z];
% load mass model file (lon lat h)
dem=load('dem0','-ascii');
% define the mesh
tri=[];
% define datum (vertical reference)
vdatum='geoid'; % 'ellipsoid' or 'geoid'
% define ellipsoid reference's parameters
a=6378137; % semi-major axis (in meter)
ecc=0.081819190842621; % eccentricity
% define calculation function
% ('grav' for gravity only, 'grad' for gravity and gravity gradients)
Gcalc='grav';
% set topography extension (delfaut: 180°)
extension=20;
% launch computation
R=geec_topo(coord_calc,dem,tri,vdatum,a,ecc,Gcalc,extension);
% plot results
plotfig('rb_grid',R(:,1),R(:,2),R(:,4),R(:,5),R(:,6));
% save results
outputfile='ex1_topoeffect'; % define the filename of the output
save(outputfile,'R','-ascii'); % save in ascii format
save(outputfile,'R'); % save in mat file


%% Topography effect on both gravity field and gravity gradient calculated on pre-defined locations with mesh file (Geographic coordinate system and ellispoid geometry)
% load computation points (ascii file)
coord_calc=load('loccalc','-ascii');
% load mass model (lon lat h)
dem=load('dem0','-ascii');
% load mesh file
tri=load('dem0mesh','-ascii');
% define datum (vertical reference)
vdatum='ellipsoid'; % 'ellipsoid' or 'geoid'
% define ellipsoid reference's parameters
a=6378137; % semi-major axis (in meter)
ecc=0.081819190842621; % eccentricity
% define calculation function
% ('grav' for gravity only, 'grad' for gravity and gravity gradients)
Gcalc='grad';
% set topography extension (delfaut: 180°)
extension=20;
% launch computation
R=geec_topo(coord_calc,dem,tri,vdatum,a,ecc,Gcalc,extension);
% plot results
plotfig('rb_file',R(:,1),R(:,2),R(:,4),R(:,5),R(:,6));
plotfig('rb_file',R(:,1),R(:,2),R(:,7),R(:,8),R(:,9),R(:,10),R(:,11),R(:,12));


%% Body effect on both  gravity field and gravity gradient calculated on a grid (Cartesian system and planar geometry)
% define computation points (in meter)
[X,Y]=meshgrid([-1.05:0.1:1.05],[-1.05:0.1:1.05]);
x=X(:);
y=Y(:);
z=0.01*ones(size(x));
coord_calc=[x,y,z];
% load mass model file
mass_model=load('cubepoint','-ascii');
% create triangle mesh
tri=convhull(mass_model(:,1),mass_model(:,2),mass_model(:,3));
% define the density of the mass
dens=1000;
% define calculation function
% ('grav' for gravity only, 'grad' for gravity and gravity gradients)
Gcalc='grad';
% launch computation
R=geec(coord_calc,mass_model,tri,dens,Gcalc);
% plot results
plotfig('rb_grid',R(:,1),R(:,2),R(:,4),R(:,5),R(:,6));
plotfig('rb_grid',R(:,1),R(:,2),R(:,7),R(:,8),R(:,9),R(:,10),R(:,11),R(:,12));


%% Body effect on both  gravity field and gravity gradient calculated on a grid (Geographic coordinate system and ellispoid geometry)
% define computation points (lon lat h)
[X,Y]=meshgrid([-1.05:0.1:1.05],[-1.05:0.1:1.05]);
lon=X(:);
lat=Y(:);
z=0.01*ones(size(lon));
coord_calc=[lon,lat,z];
% load mass model (lon lat z)
mass_model=load('cubepoint','-ascii');
% load mesh file
tri=load('cubemesh','-ascii');
% define density
dens=1000;
% define vertical datum
vdatum='ellipsoid';
% define ellipsoid parameters
a=6378137; % semi-major axis (m)
ecc=0.081819190842621; % eccentricity
% define calculation function
% ('grav' for gravity only, 'grad' for gravity and gravity gradients)
Gcalc='grad';
% launch computation
R=geec_geo(coord_calc,mass_model,tri,dens,vdatum,a,ecc,Gcalc);
% plot results
plotfig('rb_grid',R(:,1),R(:,2),R(:,4),R(:,5),R(:,6));
plotfig('rb_grid',R(:,1),R(:,2),R(:,7),R(:,8),R(:,9),R(:,10),R(:,11),R(:,12));


%% Body effect on both  gravity field and gravity gradient calculated on a grid (Cartesian system taking into account the curvature of the Earth)
% define computation points (in meter)
[X,Y]=meshgrid([-1.05:0.1:1.05],[-1.05:0.1:1.05]);
x=X(:);
y=Y(:);
z=0.01*ones(size(x));
coord_calc=[x,y,z];
% load mass model (x y z, in meter unit)
mass_model=load('cubepoint','-ascii');
% load mesh file
tri=load('cubemesh','-ascii');
% define the coordinate of the reference point
geo_position=[0,45];
% define the density of the mass
dens=1000;
% vertical datum ('geoid' or 'ellipsoid')
vdatum='ellipsoid';
% define ellipsoid parameters
a=6378137; % semi-major axis (in meter)
ecc=0.081819190842621; % eccentricity
% define calculatio function
% ('grav' for gravity only, 'grad' for gravity and gravity gradients)
Gcalc='grad';
% launch computation
R = geec_metric(coord_calc,mass_model,tri,geo_position,dens,vdatum,a,ecc,Gcalc);
% plot results
plotfig('rb_grid',R(:,1),R(:,2),R(:,6),R(:,7),R(:,8));
plotfig('rb_grid',R(:,1),R(:,2),R(:,9),R(:,10),R(:,11),R(:,12),R(:,13),R(:,14));