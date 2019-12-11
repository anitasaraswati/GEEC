%% Computes gravity field acceleration for the land part
% Calculation performed on each surface (top face, bottom face, and
% vertical face) of the computation area
gravixterre=0;
graviyterre=0;
gravizterre=0;

% crustal density
dens=2670;

% Topography
if isempty(tri1)==0
    % top
    Cornertop=point1;
    nsides=size(tri1,2);
    Facetop=[nsides*ones(size(tri1,1),1) tri1];
    [Gxtop,Gytop,Gztop]=gravicalc(Emes,Nmes,Umes,Cornertop,Facetop,dens);
    gravixterre=-real(Gxtop);
    graviyterre=-real(Gytop);
    gravizterre=-real(Gztop);
    % bottom
    Cornerbottom=point0;
    nsides=size(tri0_land,2);
    Facebottom=[nsides*ones(size(tri0_land,1),1) tri0_land];
    [Gxbottom,Gybottom,Gzbottom]=gravicalc(Emes,Nmes,Umes,Cornerbottom,Facebottom,dens);
    gravixterre=gravixterre-real(Gxbottom);
    graviyterre=graviyterre-real(Gybottom);
    gravizterre=gravizterre-real(Gzbottom);
end
if isempty(tri2)==0
    % vertical faces
    Cornerfacevert=point2;
    nsides=size(tri2,2);
    Facefacevert=[nsides*ones(size(tri2,1),1) tri2];
    [Gxfacevert,Gyfacevert,Gzfacevert]=gravicalc(Emes,Nmes,Umes,Cornerfacevert,Facefacevert,dens);
    gravixterre=gravixterre-real(Gxfacevert);
    graviyterre=graviyterre-real(Gyfacevert);
    gravizterre=gravizterre-real(Gzfacevert);
end
%
clear Corner* Face*;
