% check and validate the unit
cunit=get(get(handles.bg_unit,'SelectedObject'),'Tag');

if strcmp(cunit,'rb_m')
    sunit='m';
    lon0=str2double(get(handles.ed_lon0,'String'));
    lat0=str2double(get(handles.ed_lat0,'String'));    
    if lon0<-180 || lon0>360 || lat0<-90 || lat0>90
        inputvalid=0;
        errordlg('Please input a valid geographic position','Invalid Input');    
        return;
    end
end

if strcmp(cunit,'rb_deg')
    sunit='deg';
end