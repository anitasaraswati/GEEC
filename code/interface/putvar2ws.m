% put all variable into cell in a variable and assign them into base workspace

% mass geometry
% DEM
assignin('base','mymodel',mymodel);
assignin('base','modelgeo',modelgeo);
% mesh
assignin('base','mymesh',mymesh);
assignin('base','tri',tri);
% dens
if ~strcmp(masstype,'rb_topo')
    assignin('base','dens',dens);
end

% unit
assignin('base','massunit',sunit);
if strcmp(cunit,'rb_m')
    idc=[1 2 5];
else
    idc=[1 2 3];
end
coord_calc=R(:,idc);
assignin('base','coord_calc',coord_calc);

% calculation function
assignin('base','Gcalc',Gcalc);
assignin('base','grav',grav);
assignin('base','grad',grad);

% ellipsoid parameter
assignin('base','refname',refname);
assignin('base','a',a);
assignin('base','e',ecc);


% topo properties
assignin('base','extension',extension);

% orientation frame
assignin('base','so_frame',so_frame);

% computation result
assignin('base','R',R);

extract_results;
if exist('Tzz')
    assignin('base','Txx',Txx);
    assignin('base','Txy',Txy);
    assignin('base','Txz',Txz);
    assignin('base','Tyy',Tyy);
    assignin('base','Tyz',Tyz);
    assignin('base','Tzz',Tzz);  
end
if exist('gx')
    assignin('base','gx',gx);
    assignin('base','gy',gy);
    assignin('base','gz',gz);
end