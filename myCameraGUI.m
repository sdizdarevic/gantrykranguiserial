function varargout = myCameraGUI(varargin)
% MYCAMERAGUI M-file for myCameraGUI.fig
%      MYCAMERAGUI, by itself, creates a new MYCAMERAGUI or raises the existing
%      singleton*.
%
%      H = MYCAMERAGUI returns the handle to a new MYCAMERAGUI or the handle to
%      the existing singleton*.
%
%      MYCAMERAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYCAMERAGUI.M with the given input arguments.
%
%      MYCAMERAGUI('Property','Value',...) creates a new MYCAMERAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myCameraGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myCameraGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myCameraGUI

% Last Modified by GUIDE v2.5 25-May-2010 00:05:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myCameraGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @myCameraGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before myCameraGUI is made visible.
function myCameraGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myCameraGUI (see VARARGIN)

% Choose default command line output for myCameraGUI
handles.output = hObject;

% Create video object
%   Putting the object into manual trigger mode and then
%   starting the object will make GETSNAPSHOT return faster
%   since the connection to the camera will already have
%   been established.
handles.video = videoinput('winvideo', 1);
set(handles.video,'TimerPeriod', 0.05, ...
    'TimerFcn',['if(~isempty(gco)),'...
                    'handles=guidata(gcf);'...                                 % Update handles
                    'image(getsnapshot(handles.video));'...                    % Get picture using GETSNAPSHOT and put it into axes using IMAGE
                    'set(handles.cameraAxes,''ytick'',[],''xtick'',[]),'...    % Remove tickmarks and labels that are inserted when using IMAGE
                'else '...
                    'delete(imaqfind);'...                                     % Clean up - delete any image acquisition objects
                'end']);
triggerconfig(handles.video,'manual');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myCameraGUI wait for user response (see UIRESUME)
uiwait(handles.myCameraGUI);


% --- Outputs from this function are returned to the command line.
function varargout = myCameraGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
handles.output = hObject;
varargout{1} = handles.output;


% --- Executes on button press in startStopCamera.
function startStopCamera_Callback(hObject, eventdata, handles)
% hObject    handle to startStopCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Start/Stop Camera
if strcmp(get(handles.startStopCamera,'String'),'Start Camera')
    % Camera is off.  Change button string and start camera.
    set(handles.startStopCamera,'String','Stop Camera')
    start(handles.video)
else
    % Camera is on.  Stop camera and change button string.
    set(handles.startStopCamera,'String','Start Camera')
    stop(handles.video)
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',1);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',2);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',128);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton3


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',64);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- Executes on button press in togglebutton5.
function togglebutton5_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',8);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton5


% --- Executes on button press in togglebutton6.
function togglebutton6_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',4);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton6


% --- Executes on button press in togglebutton7.
function togglebutton7_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',32);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton7


% --- Executes on button press in togglebutton8.
function togglebutton8_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
   % RGB = imread('untitled.jpg');
%image=RGB
	% Toggle button is pressed-take approperiate action
      global s1; komanda(s1,'D',16);
elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed-take appropriate action
        global s1; komanda(s1,'D',0);
end
% hObject    handle to togglebutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton8





