%% get parallel option
% if the button is checked, create parallel pool on cluster
% if not, start the computation by using local resources

checkpar=get(handles.cb_parallel,'Value');
if checkpar==1
    delete(gcp);
    p=parpool;
end
%%