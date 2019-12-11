% create equidistant topo files
%
clear all;
close all;
%% addpathfile
addpathfile;
% fldterrain=strcat('../terrain');
% fldmesh=strcat(fldterrain,'/Mesh2dv24');
% fldcoordtransf=strcat('../coordtransformation');
% addpath(path,fldterrain);
% addpath(path,fldmesh);
% addpath(path,fldcoordtransf);
%% ellipsoid reference parameters
ellref=referenceEllipsoid('grs80');
a=ellref.SemimajorAxis;
ecc=ellref.Eccentricity;
%% load DEM
data=load('/run/media/saraswati/DATAPART1/data/dem/global_topography/earth2014/earth2014_1min.xyz','-ascii');
minlon=min(data(:,1));
ilon=find(data(:,1)==minlon);
maxlon=max(data(:,1));
alon=find(data(:,1)==maxlon);
milon=[data(ilon,1)+360 data(ilon,2:3)];
malon=[data(alon,1)-360 data(alon,2:3)];
data=[data; milon; malon];
clearvars minlon maxlon ilon alon milon malon;
tic;
F = scatteredInterpolant(data(1:2:end,1),data(1:2:end,2),data(1:2:end,3),'linear','linear');
toc;
clearvars data;
tic;
%% create without tri
% res=[1 2];
% for i=1:numel(res)
%     tic;
%     [lon,lat] = equidistantspherewithouttri(res(i)*1e3,a,ecc);
%     h = F(lon,lat);
%     dizaine=floor(res(i)/10);
%     unite=res(i)-10*dizaine;
%     inputfile=['./topofile/earth2014_req_grs80_',num2str(dizaine),num2str(unite),'km.mat'];
%     save(inputfile,'lon','lat','h','-v7.3');
%     toc;
% end;
%% resolution in km
res=[5 10 15 20 25 30 35 40 45 50 55 60 70 75 80 85 90 95];
%% create input files
for i=1:numel(res)
    tic;
    [lon,lat,tri] = equidistantsphere(res(i)*1e3,a,ecc);
    h = F(lon,lat);
    dizaine=floor(res(i)/10);
    unite=res(i)-10*dizaine;
    inputfile=['./topofile/earth2014_req_grs80_',num2str(dizaine),num2str(unite),'km.mat'];
    save(inputfile,'lon','lat','h','tri','-v7.3');
    toc;
end;
rmpath(fldterrain);
rmpath(fldmesh);
rmpath(fldcoordtransf);