%% Computes gravity gradients for the water part
% Calculation performed on each surface (top face, bottom face, and
% vertical face) of the computation area
Txxmer=0;
Txymer=0;
Txzmer=0;
Tyymer=0;
Tyzmer=0;
Tzzmer=0;
gravixmer=0;
graviymer=0;
gravizmer=0;

% water density
cdens=1030-2670;

% Bathymetry
if isempty(tri0_water)==0
    % top    
    Cornertop=point0;
    nsides=size(tri0_water,2);
    Facetop=[nsides*ones(size(tri0_water,1),1) tri0_water];
    [Gxtop,Gytop,Gztop,Txxtop,Txytop,Txztop,Tyytop,Tyztop,Tzztop]=...
        gradientcalc(Emes,Nmes,Umes,Cornertop,Facetop,cdens);
    gravixmer=-real(Gxtop);
    graviymer=-real(Gytop);
    gravizmer=-real(Gztop);
    Txxmer=-real(Txxtop);
    Txymer=-real(Txytop);
    Txzmer=-real(Txztop);
    Tyymer=-real(Tyytop);
    Tyzmer=-real(Tyztop);
    Tzzmer=-real(Tzztop);
end
if isempty(tri3)==0
    % Bottom    
    Cornerbottom=point3;
    nsides=size(tri3,2);
    Facebottom=[nsides*ones(size(tri3,1),1) tri3];
    [Gxbottom,Gybottom,Gzbottom,Txxbottom,Txybottom,Txzbottom,Tyybottom,Tyzbottom,Tzzbottom]=...
        gradientcalc(Emes,Nmes,Umes,Cornerbottom,Facebottom,cdens);
    gravixmer=gravixmer-real(Gxbottom);
    graviymer=graviymer-real(Gybottom);
    gravizmer=gravizmer-real(Gzbottom);
    Txxmer=Txxmer-real(Txxbottom);
    Txymer=Txymer-real(Txybottom);
    Txzmer=Txzmer-real(Txzbottom);
    Tyymer=Tyymer-real(Tyybottom);
    Tyzmer=Tyzmer-real(Tyzbottom);
    Tzzmer=Tzzmer-real(Tzzbottom);
end
if isempty(tri4)==0
    % vertical faces    
    Cornerfacevert=point4;
    nsides=size(tri4,2);
    Facefacevert=[nsides*ones(size(tri4,1),1) tri4];
    [Gxvert,Gyvert,Gzvert,Txxfacevert,Txyfacevert,Txzfacevert,Tyyfacevert,Tyzfacevert,Tzzfacevert]=...
        gradientcalc(Emes,Nmes,Umes,Cornerfacevert,Facefacevert,cdens);
    gravixmer=gravixmer-real(Gxvert);
    graviymer=graviymer-real(Gyvert);
    gravizmer=gravizmer-real(Gzvert);
    Txxmer=Txxmer-real(Txxfacevert);
    Txymer=Txymer-real(Txyfacevert);
    Txzmer=Txzmer-real(Txzfacevert);
    Tyymer=Tyymer-real(Tyyfacevert);
    Tyzmer=Tyzmer-real(Tyzfacevert);
    Tzzmer=Tzzmer-real(Tzzfacevert);
end
%
clear Corner* Face*;
