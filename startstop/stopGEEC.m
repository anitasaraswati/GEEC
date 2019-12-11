% remove GEEC path
warning off;
if isdir(GEECdir)
    rmpath(fldcode);
    rmpath(fldterrain);
    rmpath(fldcoordtransf);
    rmpath(fldmesh);
    rmpath(fldgeec);
    rmpath(fldvisual);
    rmpath(fldinterface);
    rmpath(startstop);
end
% close all figures
u=findall(0);
if numel(u.double)>1
    delete(findall(0));
end
% clear all variables excepted the result
if exist('R','var') == 1
    clearvars -except R
else
    clearvars
end