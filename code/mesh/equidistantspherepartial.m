function [lon,lat] = equidistantspherepartial( res,a,ecc,dlimit )
% input :
% res = resolution of the topo in m
% a = major axis of the earth in m
% ecc = eccentricity

% ouput:
% interpolated longitude latitude and ellpisoid height (lon lat h) in dem
% matrix

%% create the V point and Tri triangulation of the interpolated equidistant global topography
[V]=equidistantsamplingpartial(res,a,ecc,dlimit);

%% transform to geographic coordinate
[lon,lat,~] = cart2ell(V(:,1),V(:,2),V(:,3),a,ecc);

%% make sure that the range of the longitude is 0 to 360 degree
lon(lon<0)=lon(lon<0)+360;
lat(lat<-90)=-90;
lat(lat>90)=90;
end

