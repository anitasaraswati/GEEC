% get the type of the mass
masstype=get(get(handles.bg_mass_body,'SelectedObject'),'Tag');
cunit=get(get(handles.bg_unit,'SelectedObject'),'Tag');

if strcmp(cunit,'rb_deg')
    if strcmp(masstype,'rb_topo')
        R=geec_topo(coord_calc,modelgeo,tri,vdatum,a,ecc,Gcalc,extension);
    elseif strcmp(masstype,'rb_body')
        R=geec_geo(coord_calc,modelgeo,tri,dens,vdatum,a,ecc,Gcalc);
    else
        disp('Mass model is not correct')
        return;
    end
    
    % extract the results
    k=3;
    if grav==1
        gravidx=k:k+3;
        k=k+3;
    end
    if grad==1    
        gradidx=k:k+6;
    end
    
elseif strcmp(cunit,'rb_m')
    geo_position=[lon0 lat0];
    R=geec_metric(coord_calc,modelgeo,tri,geo_position,dens,vdatum,a,ecc,Gcalc);
    
     % extract the results
    k=5;
    if grav==1
        gravidx=k:k+3;
        k=k+3;
    end
    if grad==1    
        gradidx=k:k+6;
    end
    
else
    disp('Unit is not correct')
    return;
end