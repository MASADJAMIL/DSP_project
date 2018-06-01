function varargout = AudioEqulizer(varargin)
% AUDIOEQULIZER MATLAB code for AudioEqulizer.fig
%      AUDIOEQULIZER, by itself, creates a new AUDIOEQULIZER or raises the existing
%      singleton*.
%
%      H = AUDIOEQULIZER returns the handle to a new AUDIOEQULIZER or the handle to
%      the existing singleton*.
%
%      AUDIOEQULIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIOEQULIZER.M with the given input arguments.
%
%      AUDIOEQULIZER('Property','Value',...) creates a new AUDIOEQULIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AudioEqulizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AudioEqulizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AudioEqulizer

% Last Modified by GUIDE v2.5 29-May-2018 00:11:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AudioEqulizer_OpeningFcn, ...
                   'gui_OutputFcn',  @AudioEqulizer_OutputFcn, ...
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


% --- Executes just before AudioEqulizer is made visible.
function AudioEqulizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AudioEqulizer (see VARARGIN)

% Choose default command line output for AudioEqulizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AudioEqulizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AudioEqulizer_OutputFcn(hObject, eventdata, handles) 
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
[filename pathname] =uigetfile({'*.wav'},'file selector');
handles.fullpathname=strcat(pathname, filename);
set(handles.address, 'string',handles.fullpathname)
guidata(hObject,handles)
function Play_AudioEquilizer(hObject, handles)
global player;
[handles.y,handles.Fs] = audioread(handles.fullpathname);
%handles.Volume=get(handles.Volume,'value');
%handles.y=handles.y(NewStart:end,:); 
handles.S0=get(handles.slider1,'value');
handles.S1=get(handles.slider2,'value');
handles.S2=get(handles.slider3,'value');
handles.S3=get(handles.slider4,'value');
handles.S4=get(handles.slider5,'value');
 handles.S5=get(handles.slider6,'value');
 handles.S6=get(handles.slider7,'value');
 handles.S7=get(handles.slider8,'value');
% handles.g9=get(handles.slider6,'value');
set(handles.text16, 'String',handles.S0);
set(handles.text17, 'String',handles.S1);
set(handles.text18, 'String',handles.S2);
set(handles.text19, 'String',handles.S3);
set(handles.text20, 'String',handles.S4);
set(handles.text21, 'String',handles.S5);
set(handles.text22, 'String',handles.S6);
set(handles.text23, 'String',handles.S7);
%set(handles.text26, 'String',handles.g9);
%set(handles.text27, 'String',handles.g10);

cut_off=200; %cut off low pass dalama Hz
orde=16;
a=fir1(orde,cut_off/(handles.Fs/2),'low');
y1=handles.S0*filter(a,1,handles.y);

% %bandpass1
f1=201;
f2=400;
b1=fir1(orde,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.S1*filter(b1,1,handles.y);
% 
% %bandpass2
f3=401;
f4=800;
b2=fir1(orde,[f3/(handles.Fs/2) f4/(handles.Fs/2)],'bandpass');
y3=handles.S2*filter(b2,1,handles.y);
% 
% %bandpass3
 f4=801;
f5=1500;
 b3=fir1(orde,[f4/(handles.Fs/2) f5/(handles.Fs/2)],'bandpass');
 y4=handles.S3*filter(b3,1,handles.y);
% 
% %bandpass4
 f5=1501;
f6=3000;
 b4=fir1(orde,[f5/(handles.Fs/2) f6/(handles.Fs/2)],'bandpass');
 y5=handles.S4*filter(b4,1,handles.y);
% 
% %bandpass5
  f7=3001;
f8=5000;
  b5=fir1(orde,[f7/(handles.Fs/2) f8/(handles.Fs/2)],'bandpass');
  y6=handles.S5*filter(b5,1,handles.y);
% 
% %bandpass6
  f9=5001;
f10=7000;
  b6=fir1(orde,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
  y7=handles.S6*filter(b6,1,handles.y);
% 
% %bandpass7
  f11=7001;
f12=10000;
  b7=fir1(orde,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
  y8=handles.S7*filter(b7,1,handles.y);
% 
 % %bandpass8
%  f13=10001;
%f14=15000;
 % b8=fir1(orde,[f13/(handles.Fs/2) f14/(handles.Fs/2)],'bandpass');
  %y9=handles.g9*filter(b8,1,handles.y);
% 
 %highpass
%cut_off2=15000;
%c=fir1(orde,cut_off2/(handles.Fs/2),'high');
%y10=handles.g10*filter(c,1,handles.y);
%handles.yT=y1+y2+y3+y4+y5+y6+y7;
 handles.yT=y1+y2+y3+y4+y5+y6+y7+y8;
player = audioplayer(handles.Volume*handles.yT, handles.Fs);
 subplot(2,1,1);
 plot(handles.y);
 subplot(2,1,2);
 plot(handles.yT);

guidata(hObject,handles)

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
Play_AudioEquilizer(hObject,handles);
play(player);
guidata(hObject,handles)

% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
Play_AudioEquilizer(hObject,handles);
pause(player);
guidata(hObject,handles)




% --- Executes on button press in Resume.
function Resume_Callback(hObject, eventdata, handles)
% hObject    handle to Resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
Play_AudioEquilizer(hObject,handles);
resume(player);
guidata(hObject,handles)



% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
Play_AudioEquilizer(hObject,handles);
stop(player);
guidata(hObject,handles)



% --- Executes on slider movement.
function Volume_Callback(hObject, eventdata, handles)
% hObject    handle to Volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0=5;
S1=0;
S2=0;
S3=0;
S4=0;
S5=0;
S6=0;
S7=0;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0=0;
S1=5;
S2=0;
S3=0;
S4=0;
S5=0;
S6=0;
S7=0;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0=0;
S1=0;
S2=5;
S3=0;
S4=0;
S5=0;
S6=0;
S7=0;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

S0=0;
S1=0;
S2=0;
S3=5;
S4=0;
S5=0;
S6=0;
S7=0;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0=0;
S1=0;
S2=0;
S3=0;
S4=5;
S5=0;
S6=0;
S7=0;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0=0;
S1=0;
S2=0;
S3=0;
S4=0;
S5=5;
S6=0;
S7=0;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0=0;
S1=0;
S2=0;
S3=0;
S4=0;
S5=0;
S6=5;
S7=0;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0=0;
S1=0;
S2=0;
S3=0;
S4=0;
S5=0;
S6=0;
S7=5;
set(handles.slider1,'value',S0);
set(handles.slider2,'value',S1);
set(handles.slider3,'value',S2);
set(handles.slider4,'value',S3);
set(handles.slider5,'value',S4);
set(handles.slider6,'value',S5);
set(handles.slider7,'value',S6);
set(handles.slider8,'value',S7);
 
set(handles.text17,'value',S0);
set(handles.text18,'value',S1);
set(handles.text19,'value',S2);
set(handles.text20,'value',S3);
set(handles.text21,'value',S4);
set(handles.text22,'value',S5);
set(handles.text23,'value',S6);
set(handles.text24,'value',S7);

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
