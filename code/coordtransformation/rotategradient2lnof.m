function [Txx,Txy,Txz,Tyy,Tyz,Tzz]=rotategradient2lnof(Txx0,Txy0,Txz0,Tyy0,Tyz0,Tzz0)
% Rotate x eastward, y northward, z upward orientation frame into Local
% North Orientation Frame (LNOF) of GOCE which has x northward, y westward,
% and z upward axes orientation

Txx=Tyy0;
Txy=-Txy0;
Txz=Tyz0;
Tyy=Txx0;
Tyz=-Txz0;
Tzz=Tzz0;