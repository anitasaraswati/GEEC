%% Computes gravity gradients for the land part
% Calculation performed on each surface (top face, bottom face, and
% vertical face) of the computation area

% Topography
Txxterre=0;
Txyterre=0;
Txzterre=0;
Tyyterre=0;
Tyzterre=0;
Tzzterre=0;
gravixterre=0;
graviyterre=0;
gravizterre=0;

% crustal density
dens=2670;

if isempty(tri1)==0
    % top     
    Cornertop=point1;
    nsides=size(tri1,2);
    Facetop=[nsides*ones(size(tri1,1),1) tri1];
    [Gxtop,Gytop,Gztop,Txxtop,Txytop,Txztop,Tyytop,Tyztop,Tzztop]=...
        gradientcalc(Emes,Nmes,Umes,Cornertop,Facetop,dens);
    gravixterre=-real(Gxtop);
    graviyterre=-real(Gytop);
    gravizterre=-real(Gztop);
    Txxterre=-real(Txxtop);
    Txyterre=-real(Txytop);
    Txzterre=-real(Txztop);
    Tyyterre=-real(Tyytop);
    Tyzterre=-real(Tyztop);
    Tzzterre=-real(Tzztop);
end
if isempty(tri0_land)==0
    % bottom    
    Cornerbottom=point0;
    nsides=size(tri0_land,2);
    Facebottom=[nsides*ones(size(tri0_land,1),1) tri0_land];
    [Gxbottom,Gybottom,Gzbottom,Txxbottom,Txybottom,Txzbottom,Tyybottom,Tyzbottom,Tzzbottom]=...
        gradientcalc(Emes,Nmes,Umes,Cornerbottom,Facebottom,dens);
    gravixterre=gravixterre-real(Gxbottom);
    graviyterre=graviyterre-real(Gybottom);
    gravizterre=gravizterre-real(Gzbottom);
    Txxterre=Txxterre-real(Txxbottom);
    Txyterre=Txyterre-real(Txybottom);
    Txzterre=Txzterre-real(Txzbottom);
    Tyyterre=Tyyterre-real(Tyybottom);
    Tyzterre=Tyzterre-real(Tyzbottom);
    Tzzterre=Tzzterre-real(Tzzbottom);
end
if isempty(tri2)==0
    % vertical faces    
    Cornerfacevert=point2;
    nsides=size(tri2,2);
    Facefacevert=[nsides*ones(size(tri2,1),1) tri2];
    [Gxvert,Gyvert,Gzvert,Txxfacevert,Txyfacevert,Txzfacevert,Tyyfacevert,Tyzfacevert,Tzzfacevert]=...
        gradientcalc(Emes,Nmes,Umes,Cornerfacevert,Facefacevert,dens);
    gravixterre=gravixterre-real(Gxvert);
    graviyterre=graviyterre-real(Gyvert);
    gravizterre=gravizterre-real(Gzvert);
    Txxterre=Txxterre-real(Txxfacevert);
    Txyterre=Txyterre-real(Txyfacevert);
    Txzterre=Txzterre-real(Txzfacevert);
    Tyyterre=Tyyterre-real(Tyyfacevert);
    Tyzterre=Tyzterre-real(Tyzfacevert);
    Tzzterre=Tzzterre-real(Tzzfacevert);
end
%
clear Corner* Face*;
