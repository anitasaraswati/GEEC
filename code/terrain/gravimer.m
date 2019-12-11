%% Computes gravity field acceleration for the water part
% Calculation performed on each surface (top face, bottom face, and
% vertical face) of the computation area
gravixmer=0;
graviymer=0;
gravizmer=0;

% water density
cdens=1030-2670;

% Bathymetry
% top
if isempty(tri3)==0
    Cornertop=point0;
    nsides=size(tri0_water,2);
    Facetop=[nsides*ones(size(tri0_water,1),1) tri0_water];
    [Gxtop,Gytop,Gztop]=gravicalc(Emes,Nmes,Umes,Cornertop,Facetop,cdens);
    gravixmer=-real(Gxtop);
    graviymer=-real(Gytop);
    gravizmer=-real(Gztop);
    % Bottom
    Cornerbottom=point3;
    nsides=size(tri3,2);
    Facebottom=[nsides*ones(size(tri3,1),1) tri3];
    [Gxbottom,Gybottom,Gzbottom]=gravicalc(Emes,Nmes,Umes,Cornerbottom,Facebottom,cdens);
    gravixmer=gravixmer-real(Gxbottom);
    graviymer=graviymer-real(Gybottom);
    gravizmer=gravizmer-real(Gzbottom);
end
if isempty(tri4)==0
    % vertical faces
    Cornerfacevert=point4;
    nsides=size(tri4,2);
    Facefacevert=[nsides*ones(size(tri4,1),1) tri4];
    [Gxfacevert,Gyfacevert,Gzfacevert]=gravicalc(Emes,Nmes,Umes,Cornerfacevert,Facefacevert,cdens);
    gravixmer=gravixmer-real(Gxfacevert);
    graviymer=graviymer-real(Gyfacevert);
    gravizmer=gravizmer-real(Gzfacevert);
end
%
clear Corner* Face*;
