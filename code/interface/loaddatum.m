% load datum
select_datum=get(get(handles.bg_datum,'SelectedObject'),'Tag');

if strcmp(select_datum,'rb_geoid')
    vdatum='geoid';
else
    vdatum='ellipsoid';
end