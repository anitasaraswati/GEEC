function [V,Tri]=equidistantsamplingpartial(s,a,ecc,dlimit)
% Produce an approximately uniform sampling of a unit sphere using a spiral
% method [1]. According to this approach particle (i.e., sample) longitudes 
% are proportional to particle rank (1 to N) and latitudes are assigned to
% ensure uniform sampling density.  
%
% INPUT:
%   - s resolution in m
%   - a equatorial radius in m
%   - ecc eccentricity;
%
% OUTPUT:  
%   - V     : N-by-3 array of vertex (i.e., sample) co-ordinates.
%   - Tri   : M-by-3 list of face-vertex connectivities. 
%
%
% Modified from :
% [1] Christopher Carlson, 'How I Made Wine Glasses from Sunflowers', 
%     July 8, 2011. url: http://blog.wolfram.com/2011/07/28/how-i-made-wine-glasses-from-sunflowers/
%

area = areaquad(-90,-180,90,180,[a,ecc]);
triarea=s*s*sqrt(3)/2;
nb=area/triarea;
N=round(nb+2);

npoint=round(N(1));

selarea=areaquad(90-dlimit,-180,90,180,[a,ecc]);
nlim=ceil(selarea/triarea)+2;

gr=(1+sqrt(5))/2;       % golden ratio
ga=2*pi*(1-1/gr);       % golden angle

i=0:(nlim-1);              % particle (i.e., point sample) index
lat=acos(1-2*i/(npoint-1));  % latitude is defined so that particle index is proportional to surface area between 0 and lat
lon=i*ga;               % position particles at even intervals along longitude

% Convert from spherical to Cartesian co-ordinates
% eccentricity squared
e2 = ecc^2;
% N
N = a./sqrt(1-e2*cos(lat).^2);
X = (N).*(sin(lat).*cos(lon));
Y = (N).*(sin(lat).*sin(lon));
Z = (N.*(1-e2)).*cos(lat);

V=[X(:) Y(:) Z(:)];

% Is triangulation required?
Tri=[];
if nargout>1, Tri=convhull(V); end