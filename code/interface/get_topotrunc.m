%% get mesh properties
extension=str2double(get(handles.ed_ext,'String'));

if isnan(extension) || extension<0 || extension>180
    inputvalid=0;
    errordlg('Please input a valid truncation distance','Invalid Input');    
    return;
end