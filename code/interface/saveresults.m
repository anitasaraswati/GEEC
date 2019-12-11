% save results
fsave=get(handles.tx_fsave,'TooltipString');
if isempty(fsave)
    fsave=strcat(pwd,'/saveresults');
end

% save in *.mat
save(fsave,'R')
% save in ascii file
save(fsave,'R','-ascii');