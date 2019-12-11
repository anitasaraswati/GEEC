% extract the results
if strcmp(cunit,'rb_deg')
    k=3;
else
    k=5;
end

if grav==1
    gx=R(:,k+1);
    gy=R(:,k+2);
    gz=R(:,k+3);
    k=k+3;
end
if grad==1
    Txx=R(:,k+1);
    Txy=R(:,k+2);
    Txz=R(:,k+3);
    Tyy=R(:,k+4);
    Tyz=R(:,k+5);
    Tzz=R(:,k+6);
end