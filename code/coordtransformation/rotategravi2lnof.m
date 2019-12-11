function [gx,gy,gz]=rotategravi2lnof(gx0,gy0,gz0)
% Rotate x eastward, y northward, z upward orientation frame into Local
% North Orientation Frame (LNOF) of GOCE which has x northward, y westward,
% and z upward axes orientation

gx=gy0;
gy=-gx0;
gz=gz0;
