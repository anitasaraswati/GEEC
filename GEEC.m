function varargout = GEEC(varargin)
% GEEC MATLAB code for GEEC.fig
%      GEEC, by itself, creates a new GEEC or raises the existing
%      singleton*.
%
%      H = GEEC returns the handle to a new GEEC or the handle to
%      the existing singleton*.
%
%      GEEC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEEC.M with the given input arguments.
%
%      GEEC('Property','Value',...) creates a new GEEC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GEEC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GEEC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GEEC

% Last Modified by GUIDE v2.5 13-Dec-2018 10:52:09

% -------------------------------------------------------------------------
% license:
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the  Free  Software  Foundation; either version 3 of the License, or
%    (at your option) any later version.
%  
%    This  program is distributed in the hope that it will be useful, but 
%    WITHOUT   ANY   WARRANTY;  without  even  the  implied  warranty  of 
%    MERCHANTABILITY  or  FITNESS  FOR  A  PARTICULAR  PURPOSE.  See  the
%    GNU General Public License for more details.
%  
%    You  should  have  received a copy of the GNU General Public License
%    along with Octave; see the file COPYING.  
%    If not, see <http://www.gnu.org/licenses/>.
% -------------------------------------------------------------------------

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GEEC_OpeningFcn, ...
                   'gui_OutputFcn',  @GEEC_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GEEC is made visible.
function GEEC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GEEC (see VARARGIN)

% Choose default command line output for GEEC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(gcf,'center');

% UIWAIT makes GEEC wait for user response (see UIRESUME)
% uiwait(handles.fgrGEEC);
evalin('base','clear all');
run('startup.m');

% --- Outputs from this function are returned to the command line.
function varargout = GEEC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in pm_function.
function pm_function_Callback(hObject, eventdata, handles)
% hObject    handle to pm_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pm_function contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pm_function


% --- Executes during object creation, after setting all properties.
function pm_function_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pm_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_G_Callback(hObject, eventdata, handles)
% hObject    handle to ed_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_G as text
%        str2double(get(hObject,'String')) returns contents of ed_G as a double


% --- Executes during object creation, after setting all properties.
function ed_G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pm_orientation.
function pm_orientation_Callback(hObject, eventdata, handles)
% hObject    handle to pm_orientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pm_orientation contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pm_orientation


% --- Executes during object creation, after setting all properties.
function pm_orientation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pm_orientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on selection change in pm_ref.
function pm_ref_Callback(hObject, eventdata, handles)
% hObject    handle to pm_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pm_ref contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pm_ref
% Determine the selected data set.
str = get(hObject,'String');
val = get(hObject,'Value');
switch lower(str{val})
    case '- custom -'
        set(handles.ed_a,'Enable','on');
        set(handles.ed_e,'Enable','on');
    case 'wgs84'
        set(handles.ed_a,'Enable','off');
        set(handles.ed_e,'Enable','off');
        ell = referenceEllipsoid('wgs84');
        semimajor_axis=num2str(ell.SemimajorAxis);
        eccentricity=num2str(ell.Eccentricity,16);   
        set(handles.ed_a,'String',semimajor_axis);
        set(handles.ed_e,'String',eccentricity);
    case 'grs80'
        set(handles.ed_a,'Enable','off');
        set(handles.ed_e,'Enable','off');
        ell = referenceEllipsoid('grs80');
        semimajor_axis=num2str(ell.SemimajorAxis);
        eccentricity=num2str(ell.Eccentricity,16);    
        set(handles.ed_a,'String',semimajor_axis);
        set(handles.ed_e,'String',eccentricity);
end

% Save the handles structure.
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function pm_ref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pm_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ed_a_Callback(hObject, eventdata, handles)
% hObject    handle to ed_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_a as text
%        str2double(get(hObject,'String')) returns contents of ed_a as a double


% --- Executes during object creation, after setting all properties.
function ed_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_f_Callback(hObject, eventdata, handles)
% hObject    handle to ed_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_f as text
%        str2double(get(hObject,'String')) returns contents of ed_f as a double


% --- Executes during object creation, after setting all properties.
function ed_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_e_Callback(hObject, eventdata, handles)
% hObject    handle to ed_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_e as text
%        str2double(get(hObject,'String')) returns contents of ed_e as a double


% --- Executes during object creation, after setting all properties.
function ed_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_dem.
function bt_dem_Callback(hObject, eventdata, handles)
% hObject    handle to bt_dem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename filepath]=uigetfile('*.*','Select DEM file');
if filename~=0
    myDEM=strcat(filepath, filename);
    set(handles.tx_myDEM,'string',myDEM);
    guidata(hObject,handles);
end



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over bt_dem.
function bt_dem_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to bt_dem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function ed_west_Callback(hObject, eventdata, handles)
% hObject    handle to ed_west (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_west as text
%        str2double(get(hObject,'String')) returns contents of ed_west as a double


% --- Executes during object creation, after setting all properties.
function ed_west_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_west (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_grid_Callback(hObject, eventdata, handles)
% hObject    handle to ed_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_grid as text
%        str2double(get(hObject,'String')) returns contents of ed_grid as a double


% --- Executes during object creation, after setting all properties.
function ed_grid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_east_Callback(hObject, eventdata, handles)
% hObject    handle to ed_east (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_east as text
%        str2double(get(hObject,'String')) returns contents of ed_east as a double


% --- Executes during object creation, after setting all properties.
function ed_east_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_east (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_south_Callback(hObject, eventdata, handles)
% hObject    handle to ed_south (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_south as text
%        str2double(get(hObject,'String')) returns contents of ed_south as a double


% --- Executes during object creation, after setting all properties.
function ed_south_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_south (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_north_Callback(hObject, eventdata, handles)
% hObject    handle to ed_north (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_north as text
%        str2double(get(hObject,'String')) returns contents of ed_north as a double


% --- Executes during object creation, after setting all properties.
function ed_north_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_north (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_zmes_Callback(hObject, eventdata, handles)
% hObject    handle to ed_zmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_zmes as text
%        str2double(get(hObject,'String')) returns contents of ed_zmes as a double


% --- Executes during object creation, after setting all properties.
function ed_zmes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_zmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_ext_Callback(hObject, eventdata, handles)
% hObject    handle to ed_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_ext as text
%        str2double(get(hObject,'String')) returns contents of ed_ext as a double


% --- Executes during object creation, after setting all properties.
function ed_ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_resmax_Callback(hObject, eventdata, handles)
% hObject    handle to ed_resmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_resmax as text
%        str2double(get(hObject,'String')) returns contents of ed_resmax as a double


% --- Executes during object creation, after setting all properties.
function ed_resmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_resmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_compute.
function bt_compute_Callback(hObject, eventdata, handles)
% hObject    handle to bt_compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% input validation
set(handles.bt_compute, 'Enable', 'off');
set(handles.bt_plotresult, 'Enable', 'off');
set(handles.tx_done, 'Visible', 'off');
set(handles.tx_computing ,'Visible', 'on');
drawnow
% guidata(hObject,handles);
% compute
inputvalid=startcomputation(gcbf, handles);
% make other button enable if input is valid
if inputvalid==1
    set(handles.bt_compute, 'Enable', 'on');
    gridoption=get(get(handles.bg_compoption,'SelectedObject'),'Tag');
    if strcmp(gridoption,'rb_point')==1
        set(handles.bt_plotresult, 'Enable', 'off');
    else
        set(handles.bt_plotresult, 'Enable', 'on'); 
    end
    set(handles.tx_computing ,'Visible', 'off');
    set(handles.tx_done, 'Visible', 'on');
else
    set(handles.bt_compute, 'Enable', 'on');
    set(handles.bt_plotresult, 'Enable', 'off');
    set(handles.tx_done, 'Visible', 'off');
    set(handles.tx_computing ,'Visible', 'off');
%     drawnow
end
guidata(hObject,handles);



function [inputvalid]=startcomputation(fig_handles, handles)
disp('Starting ...');
inputvalid=1;


% check and load mass model
% point clouds
loadmodelfile;
% mesh
loadmeshfile;
% density
loaddens;

% get computation points
getcomp_points;

% get unit
getunit;

% get calculation function
getcalctype;

% get ellipticity parameters
getellipparameter;

% topography parameters
get_topotrunc;
loaddatum;

if inputvalid==1
    getparalleloption;
    
    % calculate and extract the results
    calcfunction;    
    
    % get choosen orientation frame and proceed
    getoframe;
    
    % save
    saveresults;
    % put all variable into cell in a variable and assign them into base
    % workspace
    putvar2ws;
    disp('Finished ...');
else
    errordlg('Please check again your input!','Invalid Input');
    return;
end




% --- Executes on button press in bt_showmesh.
function bt_showmesh_Callback(hObject, eventdata, handles)
% hObject    handle to bt_showmesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_plotresult.
function bt_plotresult_Callback(hObject, eventdata, handles)
% hObject    handle to bt_plotresult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotresults;


% --- Executes during object creation, after setting all properties.
function fgrGEEC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fgrGEEC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in bt_close.
function bt_close_Callback(hObject, eventdata, handles)
% hObject    handle to bt_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% remove the path
fldgeec=evalin('base','fldgeec');
fldcode=evalin('base','fldcode');
fldcoordtransf=evalin('base','fldcoordtransf');
fldmesh=evalin('base','fldmesh');
fldterrain=evalin('base','fldterrain');
fldvisual=evalin('base','fldvisual');
fldinterface=evalin('base','fldinterface');
rmpath(fldgeec);
rmpath(fldcode);
rmpath(fldvisual);
rmpath(fldmesh);
rmpath(fldterrain);
rmpath(fldcoordtransf);
rmpath(fldinterface);

% clear the variables
% clc;
% clearStr= 'clear all';
% evalin('base',clearStr);

delete(handles.fgrGEEC);


% --- Executes on button press in pb_mesh.
function pb_mesh_Callback(hObject, eventdata, handles)
% hObject    handle to pb_mesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
show_mesh;
% assignin('base','testdem',dem);


% --- Executes when user attempts to close fgrGEEC.
function fgrGEEC_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to fgrGEEC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

% remove the path
fldgeec=evalin('base','fldgeec');
fldcode=evalin('base','fldcode');
fldcoordtransf=evalin('base','fldcoordtransf');
fldmesh=evalin('base','fldmesh');
fldterrain=evalin('base','fldterrain');
fldvisual=evalin('base','fldvisual');
fldinterface=evalin('base','fldinterface');
rmpath(fldgeec);
rmpath(fldcode);
rmpath(fldvisual);
rmpath(fldmesh);
rmpath(fldterrain);
rmpath(fldcoordtransf);
rmpath(fldinterface);

% clear the variables
% clc;
% clearStr= 'clear all';
% evalin('base',clearStr);

delete(handles.fgrGEEC);


% --- Executes on button press in cb_gravity.
function cb_gravity_Callback(hObject, eventdata, handles)
% hObject    handle to cb_gravity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_gravity


% --- Executes on button press in cb_gradient.
function cb_gradient_Callback(hObject, eventdata, handles)
% hObject    handle to cb_gradient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_gradient


% --- Executes on button press in rb_normal.
function rb_normal_Callback(hObject, eventdata, handles)
% hObject    handle to rb_normal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_normal



function ed_resmin_Callback(hObject, eventdata, handles)
% hObject    handle to ed_resmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_resmin as text
%        str2double(get(hObject,'String')) returns contents of ed_resmin as a double


% --- Executes during object creation, after setting all properties.
function ed_resmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_resmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to ed_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_G as text
%        str2double(get(hObject,'String')) returns contents of ed_G as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cb_parallel.
function cb_parallel_Callback(hObject, eventdata, handles)
% hObject    handle to cb_parallel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_parallel


% --- Executes during object creation, after setting all properties.
function bt_close_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bt_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in bt_browsecalc.
function bt_browsecalc_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsecalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename filepath]=uigetfile('*.*','Select computation point file');
if filename~=0
    mycalcpoint=strcat(filepath, filename);
    set(handles.tx_mycalcpoint,'String',filename,'TooltipString',mycalcpoint);
    guidata(hObject,handles);
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to ed_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_grid as text
%        str2double(get(hObject,'String')) returns contents of ed_grid as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to ed_west (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_west as text
%        str2double(get(hObject,'String')) returns contents of ed_west as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_west (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to ed_east (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_east as text
%        str2double(get(hObject,'String')) returns contents of ed_east as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_east (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to ed_south (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_south as text
%        str2double(get(hObject,'String')) returns contents of ed_south as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_south (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to ed_north (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_north as text
%        str2double(get(hObject,'String')) returns contents of ed_north as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_north (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to ed_zmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_zmes as text
%        str2double(get(hObject,'String')) returns contents of ed_zmes as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_zmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_pointlong_Callback(hObject, eventdata, handles)
% hObject    handle to ed_pointlong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_pointlong as text
%        str2double(get(hObject,'String')) returns contents of ed_pointlong as a double


% --- Executes during object creation, after setting all properties.
function ed_pointlong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_pointlong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_pointlat_Callback(hObject, eventdata, handles)
% hObject    handle to ed_pointlat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_pointlat as text
%        str2double(get(hObject,'String')) returns contents of ed_pointlat as a double


% --- Executes during object creation, after setting all properties.
function ed_pointlat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_pointlat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_pointaltmes_Callback(hObject, eventdata, handles)
% hObject    handle to ed_pointaltmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_pointaltmes as text
%        str2double(get(hObject,'String')) returns contents of ed_pointaltmes as a double


% --- Executes during object creation, after setting all properties.
function ed_pointaltmes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_pointaltmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in bg_compoption.
function bg_compoption_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bg_compoption 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.rb_grid)
    set(handles.ed_grid,'Enable','on');
    set(handles.ed_west,'Enable','on');
    set(handles.ed_east,'Enable','on');
    set(handles.ed_north,'Enable','on');
    set(handles.ed_south,'Enable','on');
    set(handles.ed_zmes,'Enable','on');    
    set(handles.bt_browsecalc,'Enable','off');
else
    set(handles.ed_grid,'Enable','off');
    set(handles.ed_west,'Enable','off');
    set(handles.ed_east,'Enable','off');
    set(handles.ed_north,'Enable','off');
    set(handles.ed_south,'Enable','off');
    set(handles.ed_zmes,'Enable','off');    
    set(handles.bt_browsecalc,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function bt_dem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bt_dem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when fgrGEEC is resized.
function fgrGEEC_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to fgrGEEC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cb_parallel.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to cb_parallel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_parallel


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_browsesave.
function bt_browsesave_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsesave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, filepath]=uiputfile('*.*','Save file as');
if filename~=0
    mysavefile=strcat(filepath, filename);
    set(handles.tx_fsave,'String',filename,'TooltipString',mysavefile);
    guidata(hObject,handles);
end



function ed_lon0_Callback(hObject, eventdata, handles)
% hObject    handle to ed_lon0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_lon0 as text
%        str2double(get(hObject,'String')) returns contents of ed_lon0 as a double


% --- Executes during object creation, after setting all properties.
function ed_lon0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_lon0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_lat0_Callback(hObject, eventdata, handles)
% hObject    handle to ed_lat0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_lat0 as text
%        str2double(get(hObject,'String')) returns contents of ed_lat0 as a double


% --- Executes during object creation, after setting all properties.
function ed_lat0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_lat0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_browsemodel.
function bt_browsemodel_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsemodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, filepath]=uigetfile('*.*','Select model geometry file');
if filename~=0
    mymodelfile=strcat(filepath, filename);
    set(handles.tx_fmodel,'String',filename,'TooltipString',mymodelfile);
    guidata(hObject,handles);
end


% --- Executes on key press with focus on bt_browsesave and none of its controls.
function bt_browsesave_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to bt_browsesave (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on key press with focus on bt_browsesave and none of its controls.
function bt_close_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to bt_browsesave (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cb_gravity.
function cb_grav_Callback(hObject, eventdata, handles)
% hObject    handle to cb_gravity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_gravity


% --- Executes on button press in cb_gradient.
function cb_grad_Callback(hObject, eventdata, handles)
% hObject    handle to cb_gradient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_gradient


% --- Executes when selected object is changed in bg_unit.
function bg_unit_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bg_unit 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.rb_deg)
    set(handles.tx_unit,'String','[°]');
    set(handles.tx_geopos,'Enable','off');
    set(handles.tx_lon0,'Enable','off');
    set(handles.ed_lon0,'Enable','off');
    set(handles.tx_lat0,'Enable','off');
    set(handles.ed_lat0,'Enable','off');
else
    set(handles.tx_unit,'String','[m]');
    set(handles.tx_geopos,'Enable','on');
    set(handles.tx_lon0,'Enable','on');
    set(handles.ed_lon0,'Enable','on');
    set(handles.tx_lat0,'Enable','on');
    set(handles.ed_lat0,'Enable','on');
end


% --- Executes when selected object is changed in bg_mass_body.
function bg_mass_body_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bg_mass_body 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.rb_topo)
    set(handles.tx_topo_dist,'Enable','on');
    set(handles.tx_unit,'Enable','on');
    set(handles.ed_ext,'Enable','on');
    set(handles.rb_m,'Enable','off');
    
    set(handles.tx_denstext,'Visible','off');
    set(handles.pm_dens,'Visible','off');
    set(handles.ed_densuniform,'Visible','off');
    set(handles.tx_densunit,'Visible','off');
    set(handles.bt_browsedens,'Visible','off');
    set(handles.tx_fdens,'Visible','off');
else
    set(handles.tx_topo_dist,'Enable','off');
    set(handles.tx_unit,'Enable','off');
    set(handles.ed_ext,'Enable','off');
    set(handles.rb_m,'Enable','on');
    
    set(handles.tx_denstext,'Visible','on');
    set(handles.pm_dens,'Visible','on');
    str = get(handles.pm_dens,'String');
    if ~iscell(str)
        str={str};
    end
    val = get(handles.pm_dens,'Value');
    switch lower(str{val})
        case 'uniform'
            set(handles.ed_densuniform,'Visible','on');
            set(handles.tx_densunit,'Visible','on');
            set(handles.bt_browsedens,'Visible','off');
            set(handles.tx_fdens,'Visible','off');
        case 'facet distribution'
            set(handles.ed_densuniform,'Visible','off');
            set(handles.tx_densunit,'Visible','off');
            set(handles.bt_browsedens,'Visible','on');
            set(handles.tx_fdens,'Visible','on');
    end
end


% --- Executes on button press in bt_browsemesh.
function bt_browsemesh_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsemesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, filepath]=uigetfile('*.*','Select geometry mesh file');
if filename~=0
    mymeshfile=strcat(filepath, filename);
    set(handles.tx_fmesh,'String',filename,'TooltipString',mymeshfile);
    bodytype=get(handles.rb_body,'Value');
    if (bodytype==1) && ~isempty(filename)
        str_dens={'Uniform';'Facet distribution'};
        set(handles.pm_dens,'String',str_dens);
        set(handles.tx_denstext,'Visible','on');
        set(handles.pm_dens,'Visible','on');
        str = get(handles.pm_dens,'String');
        if ~iscell(str)
            str={str};
        end
        val = get(handles.pm_dens,'Value');
        switch lower(str{val})
            case 'uniform'
                set(handles.ed_densuniform,'Visible','on');
                set(handles.tx_densunit,'Visible','on');
                set(handles.bt_browsedens,'Visible','off');
                set(handles.tx_fdens,'Visible','off');
            case 'facet distribution'
                set(handles.ed_densuniform,'Visible','off');
                set(handles.tx_densunit,'Visible','off');
                set(handles.bt_browsedens,'Visible','on');
                set(handles.tx_fdens,'Visible','on');
        end
    end
%     set(handles.pm_dens,'Value',lower(str{strdens});
    guidata(hObject,handles);
end


% --- Executes on selection change in pm_dens.
function pm_dens_Callback(hObject, eventdata, handles)
% hObject    handle to pm_dens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pm_dens contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pm_dens
% Determine the selected data set.
str = get(hObject,'String');
if ~iscell(str)
    str={str};
end
val = get(hObject,'Value');
switch lower(str{val})
    case 'uniform'
        set(handles.ed_densuniform,'Visible','on');
        set(handles.tx_densunit,'Visible','on');
        set(handles.bt_browsedens,'Visible','off');
        set(handles.tx_fdens,'Visible','off');
    case 'facet distribution'
        set(handles.ed_densuniform,'Visible','off');
        set(handles.tx_densunit,'Visible','off');
        set(handles.bt_browsedens,'Visible','on');
        set(handles.tx_fdens,'Visible','on');
end

% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function pm_dens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pm_dens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_densuniform_Callback(hObject, eventdata, handles)
% hObject    handle to ed_densuniform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_densuniform as text
%        str2double(get(hObject,'String')) returns contents of ed_densuniform as a double


% --- Executes during object creation, after setting all properties.
function ed_densuniform_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_densuniform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_browsedens.
function bt_browsedens_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsedens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, filepath]=uigetfile('*.*','Select density file');
if filename~=0
    mydensfile=strcat(filepath, filename);
    set(handles.tx_fdens,'String',filename,'TooltipString',mydensfile);
    guidata(hObject,handles);
end


% --- Executes on button press in bt_compute.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to bt_compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_plotresult.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to bt_plotresult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_close.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to bt_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_browsesave.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsesave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in pm_ref.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to pm_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pm_ref contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pm_ref


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pm_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to ed_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_a as text
%        str2double(get(hObject,'String')) returns contents of ed_a as a double


% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit42_Callback(hObject, eventdata, handles)
% hObject    handle to ed_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_e as text
%        str2double(get(hObject,'String')) returns contents of ed_e as a double


% --- Executes during object creation, after setting all properties.
function edit42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cb_gravity.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to cb_gravity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_gravity


% --- Executes on button press in cb_gradient.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to cb_gradient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_gradient



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to ed_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_ext as text
%        str2double(get(hObject,'String')) returns contents of ed_ext as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_mesh.
function bt_mesh_Callback(hObject, eventdata, handles)
% hObject    handle to pb_mesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cb_parallel.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to cb_parallel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_parallel



function edit38_Callback(hObject, eventdata, handles)
% hObject    handle to ed_lon0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_lon0 as text
%        str2double(get(hObject,'String')) returns contents of ed_lon0 as a double


% --- Executes during object creation, after setting all properties.
function edit38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_lon0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit39_Callback(hObject, eventdata, handles)
% hObject    handle to ed_lat0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_lat0 as text
%        str2double(get(hObject,'String')) returns contents of ed_lat0 as a double


% --- Executes during object creation, after setting all properties.
function edit39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_lat0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_browsecalc.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsecalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_browsemodel.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsemodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_browsemesh.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsemesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in pm_dens.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to pm_dens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pm_dens contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pm_dens


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pm_dens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to ed_densuniform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_densuniform as text
%        str2double(get(hObject,'String')) returns contents of ed_densuniform as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_densuniform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_browsedens.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browsedens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to ed_north (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_north as text
%        str2double(get(hObject,'String')) returns contents of ed_north as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_north (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to ed_west (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_west as text
%        str2double(get(hObject,'String')) returns contents of ed_west as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_west (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to ed_east (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_east as text
%        str2double(get(hObject,'String')) returns contents of ed_east as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_east (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to ed_south (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_south as text
%        str2double(get(hObject,'String')) returns contents of ed_south as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_south (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit36_Callback(hObject, eventdata, handles)
% hObject    handle to ed_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_grid as text
%        str2double(get(hObject,'String')) returns contents of ed_grid as a double


% --- Executes during object creation, after setting all properties.
function edit36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit37_Callback(hObject, eventdata, handles)
% hObject    handle to ed_zmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_zmes as text
%        str2double(get(hObject,'String')) returns contents of ed_zmes as a double


% --- Executes during object creation, after setting all properties.
function edit37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_zmes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in bg_mass_body.
function bg_massbody_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bg_mass_body 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function bg_mass_body_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bg_mass_body (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
