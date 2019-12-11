% load model data file (ASCII) and save it into dem variable
mymesh=get(handles.tx_fmesh,'TooltipString');
if isempty(mymesh)        
    tri=[];
    return;
end

% changed to compare
fext=mymesh(end-2:end);
if strcmp(fext,'mat')
    %load(mymodel);
    loadobj=matfile(mymesh);
    varlist=who(loadobj);
    varname=varlist{1};
    tri=loadobj.(varname);
else
    tri=load(mymesh,'-ascii');
end

if isempty(tri)
    inputvalid=0;
    errordlg('Mesh file is empty!','Invalid Input');
    return;
end


% assignin('base','dem',dem);
