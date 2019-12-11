%% path to use GEEC
% GEEC path
GEECdir='C:\Users\anita.saraswati\Documents\codework\GEEC2020';
% generate path
fldcode=strcat(GEECdir,'/code');
fldterrain=strcat(GEECdir,'/code/terrain');
fldcoordtransf=strcat(GEECdir,'/code/coordtransformation');
fldmesh=strcat(GEECdir,'/code/mesh');
fldgeec=strcat(GEECdir,'/code/geec_fld');
fldvisual=strcat(GEECdir,'/code/visualization');
fldinterface=strcat(GEECdir,'/code/interface');
fldstartstop=strcat(GEECdir,'/startstop');
% addpath
addpath(GEECdir);
addpath(fldcode);
addpath(fldterrain);
addpath(fldcoordtransf);
addpath(fldmesh);
addpath(fldgeec);
addpath(fldvisual);
addpath(fldinterface);
addpath(fldstartstop);
%
assignin('base','GEECdir',GEECdir);
assignin('base','fldgeec',fldgeec);
assignin('base','fldcode',fldcode);
assignin('base','fldcoordtransf',fldcoordtransf);
assignin('base','fldmesh',fldmesh);
assignin('base','fldterrain',fldterrain);
assignin('base','fldvisual',fldvisual);
assignin('base','fldinterface',fldinterface);
assignin('base','fldstartstop',fldstartstop);
% disable automatic parallel pool
ps = parallel.Settings;
ps.Pool.AutoCreate = false;
