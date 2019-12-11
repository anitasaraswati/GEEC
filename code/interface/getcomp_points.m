%% get grid properties
gridoption=get(get(handles.bg_compoption,'SelectedObject'),'Tag');

if strcmp(gridoption,'rb_grid')
    west=str2double(get(handles.ed_west,'String'));
    east=str2double(get(handles.ed_east,'String'));
    south=str2double(get(handles.ed_south,'String'));
    north=str2double(get(handles.ed_north,'String'));
    gridstep=str2double(get(handles.ed_grid,'String'));
    altmes=str2double(get(handles.ed_zmes,'String'));
        
    if isnan(west) || isnan(east) || isnan(south) || isnan(north) || isnan(gridstep) || isnan(altmes)
        inputvalid=0;
        errordlg('Please input valid coordinate value. Coordinate of computation point is not a number','Invalid grid input');    
        return;
    end
    
    if west>east || south>north
        inputvalid=0;
        errordlg('Please input valid coordinate value','Invalid grid input');    
        return;
    end
    
    cunit=get(get(handles.bg_unit,'SelectedObject'),'Tag');    
    if strcmp(cunit,'rb_deg')
        if west<-180 || east>360 || south<-90 || north>90
            inputvalid=0;
            errordlg('Please input valid geographic limit of computation point','Invalid Input');
            return;
        end
    end
        
    xx=west:gridstep:east;
    yy=north:-gridstep:south;
    [lonmes,latmes]=meshgrid(xx,yy);
    lonmes=reshape(lonmes',numel(lonmes),1);
    latmes=reshape(latmes',numel(latmes),1);
    zmes=ones(size(lonmes))*altmes; 
    coord_calc=[lonmes,latmes,zmes];
    clear lonmes latmes zmes

elseif strcmp(gridoption,'rb_fromfile')
    mycalcpoint=get(handles.tx_mycalcpoint,'String');
    
    if strcmp(mycalcpoint,'...') || isempty(mycalcpoint)
        inputvalid=0;
        errordlg('Please input valid file','Invalid file input');    
        return;
    end
    
    fext=mycalcpoint(end-2:end);
    if strcmp(fext,'mat')
        loadobj=matfile(mycalcpoint);
        varlist=who(loadobj);
        varname=varlist{1};
        coord_calc=loadobj.(varname);
    else
        coord_calc=load(mycalcpoint,'-ascii');
    end

    idx=find(isnan(coord_calc)==0);
    if isempty(coord_calc) || isempty(idx)
        inputvalid=0;
        errordlg('Calc point is empty','Invalid input points');    
        return;
    end
    
    
end