% load density value and save it into dem variable
% if the mass is topography, skip
bodytype=get(handles.rb_body,'Value');
if (bodytype==0)
    return;
end

% get parameter
str = get(handles.pm_dens,'String');
val = get(handles.pm_dens,'Value');

str=cellstr(str);

% condition each parameters
switch lower(str{val})
    case 'uniform'
        dens=get(handles.ed_densuniform,'String');
        if isempty(dens)
            inputvalid=0;
            errordlg('Please insert density value','Invalid Input');
            return;
        end
        dens=str2double(dens);
    case 'facet distribution'
        mydens=get(handles.tx_fdens,'TooltipString');
        if isempty(mydens)
            inputvalid=0;
            errordlg('Please insert dens file','Invalid Input');
            return;
        end
        % load
        fext=mydens(end-2:end);
        if strcmp(fext,'mat')
            %load(mymodel);
            loadobj=matfile(mydens);
            varlist=who(loadobj);
            varname=varlist{1};
            dens=loadobj.(varname);
        else
            dens=load(mydens,'-ascii');
        end        
        if isempty(dens)
            inputvalid=0;
            errordlg('Mesh file is empty!','Invalid Input');
            return;
        end
        denssize=size(dens,1);
        facetsize=size(tri,1);
        if denssize~=facetsize
            inputvalid=0;
            errordlg('Density''s dimension is different than facet''s dimension','Invalid Input');
            return;
        end
end

% assignin('base','dem',dem);
