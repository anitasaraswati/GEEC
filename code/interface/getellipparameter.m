%% get ellipsoid parameters
refval=get(handles.pm_ref,'Value');
refstr=get(handles.pm_ref,'String');
refname=refstr{refval};
a=str2double(get(handles.ed_a,'String'));
ecc=str2double(get(handles.ed_e,'String'));

if isnan(a) || isnan(ecc)
    inputvalid=0;
    errordlg('Please input valid value','Invalid Input Ellip Parameters');    
    return;
end