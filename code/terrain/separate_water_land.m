function [iland,iwater,tri1,tri3] = separate_water_land(tri,dem)
tri0=tri;
tri1=tri0;
tri3=fliplr(tri1);

h=dem(:,3);

iland=find(h>0);
iwater=find(h<0);

d1=ismember(tri1(:,1),iland);
d2=ismember(tri1(:,2),iland);
d3=ismember(tri1(:,3),iland);
dland= d1 | d2 | d3;
tri1_calc=tri1(dland,:);
clear tri1;
tri1=tri1_calc;
clear tri1_calc;

d1=ismember(tri3(:,1),iwater);
d2=ismember(tri3(:,2),iwater);
d3=ismember(tri3(:,3),iwater);
dwater= d1 | d2 | d3;
tri3_calc=tri3(dwater,:);
clear tri3;
tri3=tri3_calc;
clear tri3_calc;

clear h d1 d2 d3 dland dwater Tri