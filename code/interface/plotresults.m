varname=evalin('base','who');
for i=1:numel(varname)    
    varvalue=evalin('base',varname{i});
    assignin('caller',varname{i},varvalue);
end

gridoption=get(get(handles.bg_compoption,'SelectedObject'),'Tag');
if grav==1
    plotfig(gridoption,coord_calc(:,1),coord_calc(:,2),gx,gy,gz);
end

if grad==1
    plotfig(gridoption,coord_calc(:,1),coord_calc(:,2),Txx,Txy,Txz,Tyy,Tyz,Tzz);
end