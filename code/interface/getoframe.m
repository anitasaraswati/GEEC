o_frame=get(get(handles.bg_orientation,'SelectedObject'),'Tag');
so_frame=get(get(handles.bg_orientation,'SelectedObject'),'String');
gravidx=4:6;
gradidx=7:12;
if strcmp(o_frame,'rb_lnof')
    extract_results;
    if grad==1
        [Txx,Txy,Txz,Tyy,Tyz,Tzz]=rotategradient2lnof(Txx,Txy,Txz,Tyy,Tyz,Tzz);
        gradlnof=[Txx,Txy,Txz,Tyy,Tyz,Tzz];
        R(:,gradidx)=gradlnof;
    end
    if grav==1
        [gx,gy,gz]=rotategravi2lnof(gx,gy,gz);
        gravlnof=[gx,gy,gz];
        R(:,gravidx)=gravlnof;
    end    
end