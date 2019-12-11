% calculate a cube
% calculation points
% [x y z] 
% xx=-50:2:150; yy=xx;
xx=-100:2:100; yy=xx;
[xmes,ymes]=meshgrid(xx,yy);
xmes=reshape(xmes,[],1);
ymes=reshape(ymes,[],1);
zmes=ones(size(xmes))*5;
coord_calc=[xmes,ymes,zmes];


% body mass model
% dem
dem=load('./massmodel/cube','-ascii');
dem=dem*99;
dem(:,1:2)=dem(:,1:2)-49.5;
x=dem(:,1); y=dem(:,2); z=dem(:,3);
tri=convhull(x,y,z);

dens=3000;

% Gcalc = grav or grad
% grav: calculation of gravity only
% grad: calculation of gravity and gravity gradients
Gcalc='grad';

% activate this part if the calculation is performed in parallel
% npool=12;
% p = parpool(npool);

% launch geec
R = geec_flat(coord_calc,dem,tri,dens,Gcalc);

% activate and modify this part to save the results
outputfile='savedata/cubecalc5_3';
save(outputfile,'R')


delete(gcp)
