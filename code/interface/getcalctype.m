%% get calculation function properties
calc_type=get(get(handles.bg_calctype,'SelectedObject'),'Tag');

if strcmp(calc_type,'rb_grad')
    grad=1;
    grav=1;
    Gcalc='grad';
else
    grav=1;
    grad=0;
    Gcalc='grav';
end