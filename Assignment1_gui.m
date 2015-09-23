function varargout = Assignment1_gui(varargin)
% ASSIGNMENT1_GUI MATLAB code for Assignment1_gui.fig
%      ASSIGNMENT1_GUI, by itself, creates a new ASSIGNMENT1_GUI or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT1_GUI returns the handle to a new ASSIGNMENT1_GUI or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT1_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT1_GUI.M with the given input arguments.
%
%      ASSIGNMENT1_GUI('Property','Value',...) creates a new ASSIGNMENT1_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment1_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment1_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment1_gui

% Last Modified by GUIDE v2.5 22-Sep-2015 11:52:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment1_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment1_gui_OutputFcn, ...
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


% --- Executes just before Assignment1_gui is made visible.
function Assignment1_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment1_gui (see VARARGIN)

% Choose default command line output for Assignment1_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment1_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment1_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function alphavalue_Callback(hObject, eventdata, handles)
% hObject    handle to alphavalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphavalue as text
%        str2double(get(hObject,'String')) returns contents of alphavalue as a double


% --- Executes during object creation, after setting all properties.
function alphavalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphavalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WindowSize_Callback(hObject, eventdata, handles)
% hObject    handle to WindowSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindowSize as text
%        str2double(get(hObject,'String')) returns contents of WindowSize as a double


% --- Executes during object creation, after setting all properties.
function WindowSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindowSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in executeGIF.
function executeGIF_Callback(hObject, eventdata, handles)
% hObject    handle to executeGIF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(hObject); 

[File_Name, Path_Name] = uigetfile('PATHNAME');
axes(handles.axis1InputDisplay);
I=imread([Path_Name,File_Name]);
imshow(uint8(I),[]);

[row,col,dim]=size(I);
w_size=str2num(get(handles.WindowSize,'String'));
alpha=str2num(get(handles.alphavalue,'String'));
if((mod(w_size,2)~=0)&& alpha<=1 && alpha>=0 && dim==1)
  I_gradInvFilt = GradientInverseFilter(I,alpha,w_size );
  axes(handles.axes2OutputDisplay)
  imshow(uint8(I_gradInvFilt),[]);
    
end
if(mod(w_size,2)==0)
    h = msgbox('Please choose a mask of odd length i.e. 3, 5, 7, etc ..','Input Error');
end
if(dim~=1)
    h = msgbox('Please choose a grayscale image','Input Error');
end
if(alpha>1 || alpha<0)
    h = msgbox('Please choose a value of alpha in [0,1]','Input Error');
end

%I_gradInvFilt = GradientInverseFilter( I,alpha,w_size );
%figure;imshow(uint8(I),[]);title('Original Image');
%figure;imshow(uint8(I_gradInvFilt),[]);title('Gradient inverse filtered Image');
%figure;imshow(uint8(abs(I_gradInvFilt-double(I))));title('Difference image');
