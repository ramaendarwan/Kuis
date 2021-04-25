function varargout = mining_123190146(varargin)
% MINING_123190146 MATLAB code for mining_123190146.fig
%      MINING_123190146, by itself, creates a new MINING_123190146 or raises the existing
%      singleton*.
%
%      H = MINING_123190146 returns the handle to a new MINING_123190146 or the handle to
%      the existing singleton*.
%
%      MINING_123190146('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINING_123190146.M with the given input arguments.
%
%      MINING_123190146('Property','Value',...) creates a new MINING_123190146 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mining_123190146_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mining_123190146_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mining_123190146

% Last Modified by GUIDE v2.5 25-Apr-2021 21:13:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mining_123190146_OpeningFcn, ...
                   'gui_OutputFcn',  @mining_123190146_OutputFcn, ...
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


% --- Executes just before mining_123190146 is made visible.
function mining_123190146_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mining_123190146 (see VARARGIN)

% Choose default command line output for mining_123190146
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mining_123190146 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mining_123190146_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('jobclass.csv');
opts.SelectedVariableNames = (2:3);
data = readmatrix('jobclass.csv', opts);
set(handles.uitable1,'data',data);



function jf_Callback(hObject, eventdata, handles)
% hObject    handle to jf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jf as text
%        str2double(get(hObject,'String')) returns contents of jf as a double


% --- Executes during object creation, after setting all properties.
function jf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jc_Callback(hObject, eventdata, handles)
% hObject    handle to jc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jc as text
%        str2double(get(hObject,'String')) returns contents of jc as a double


% --- Executes during object creation, after setting all properties.
function jc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jc = str2double(get(handles.jc,'String'));
jf = str2double(get(handles.jf,'String'));

sample = [jc jf]; 

opts = detectImportOptions('jobclass.csv');
opts.SelectedVariableNames = (2:3);
training = readmatrix('jobclass.csv', opts);

opts = detectImportOptions('jobclass.csv');
opts.SelectedVariableNames = (4);
group = readmatrix('jobclass.csv', opts);

class = fitcknn(training, group, 'NumNeighbors', 3);
klasifikasi = predict(class, sample);

set(handles.hasil, 'string', klasifikasi);