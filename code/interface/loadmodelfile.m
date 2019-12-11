% load model data file (ASCII) and save it into dem variable
mymodel=get(handles.tx_fmodel,'TooltipString');
if isempty(mymodel)    
    inputvalid=0;
    errordlg('Please insert Model file','Invalid Input');    
    return;
end

% changed to compare
fext=mymodel(end-2:end);
if strcmp(fext,'mat')
    %load(mymodel);
    loadobj=matfile(mymodel);
    varlist=who(loadobj);
    varname=varlist{1};
    modelgeo=loadobj.(varname);
else
    modelgeo=load(mymodel,'-ascii');
end

if isempty(modelgeo)
    inputvalid=0;
    errordlg('Model file is empty!','Invalid Input');
    return;
end


% assignin('base','dem',dem);
