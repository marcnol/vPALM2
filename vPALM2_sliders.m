%%vPALM2_sliders
%% 2d-3d commands for figure3D


function [h_sliders] = vPALM2_sliders(h,varargin)

disp('ass')

h = get(h.MainFig, 'UserData');  
h_sliders.h=h;

% h=varargin{1}; % handles h
% h_vis.axes2=h.axes2;
scrsz = get(0,'ScreenSize');
% FIGH=scrsz(4)/1;
% FIGW=scrsz(3)*.8;
FIGH=350;
FIGW=250; %1092

h_sliders.axes2=h.axes2; %figure();

% axis2_size=[1 1 250 250];
% 
% h_vis.axes2= axes('Parent',h_vis.Figure3D,'Position',axis2_size);
% 
MainWindowPos=get(h.MainFig,'Position')

h_sliders.fig = figure(...
              'Name','sliders',...
              'Units','pixels',...
              'MenuBar','none',...
              'Toolbar','none',...
              'Color','w',...              
              'Position',[MainWindowPos(3)+5 MainWindowPos(4)-FIGH-200 FIGW FIGH],...
              'Visible','on',...
              'CloseRequestFcn',@newclosefunction);

get(h_sliders.fig,'Position')

h_sliders=vPALM2_sliders_GUI(h_sliders,FIGH,FIGW);

vPALM2_sliders_callbacks(h_sliders);

end

%% GUI construction
function h_sliders=vPALM2_sliders_GUI(h_sliders,FIGH,FIGW)

top=FIGH-100;
hor_spacing=5;
ver_spacing=0;
text_size=[90, 20];
slider_size=[100, 20];
edit_size=[60, 30];
displine=[0:20:300];
slider_x=[2 100 100+slider_size(1)];%10+[0:10]*(slider_size(1)+2*hor_spacing+edit_size(1));        
forecolor=[0 0 0];
textcolor=[0 0 0];
backgroundcolor=[1 1 1];

% sliders
h_sliders.Imin_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[.1 .1]/100,...
                'Position',[slider_x(2) top-displine(1) slider_size(1) slider_size(2)]);           
h_sliders.Imax_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(2) slider_size(1) slider_size(2)]);
h_sliders.Frmin_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(3) slider_size(1) slider_size(2)]);
h_sliders.Frmax_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(4) slider_size(1) slider_size(2)]);
h_sliders.Xmin_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(5) slider_size(1) slider_size(2)]);           
h_sliders.Xmax_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(6) slider_size(1) slider_size(2)]);
h_sliders.Ymin_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(7) slider_size(1) slider_size(2)]);
h_sliders.Ymax_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(8) slider_size(1) slider_size(2)]);      
h_sliders.Zmin_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(9) slider_size(1) slider_size(2)]);
h_sliders.Zmax_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',100,'Min',0,'Value',25,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(10) slider_size(1) slider_size(2)]);  
h_sliders.detect_thresh_slider = uicontrol(h_sliders.fig,'Style','slider',...
                'Max',1000,'Min',1,'Value',30,...
                'SliderStep',[0.05 0.2],...
                'Position',[slider_x(2) top-displine(11) slider_size(1) slider_size(2)]);  
            
% slider text

h_sliders.Imin_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','I min',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(1)  text_size(1) text_size(2)]);
h_sliders.Imax_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','I max',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(2)  text_size(1) text_size(2)]);
h_sliders.Frmin_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','Min Frame',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(3)  text_size(1) text_size(2)]);
h_sliders.Frmax_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','Max Frame',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(4)  text_size(1) text_size(2)]);
h_sliders.Xmin_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','X min',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(5)  text_size(1) text_size(2)]);
h_sliders.Xmax_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','X max',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(6)  text_size(1) text_size(2)]);
h_sliders.Ymin_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','Y min',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(7)  text_size(1) text_size(2)]);
h_sliders.Ymax_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','Y max',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(8)  text_size(1) text_size(2)]);
h_sliders.Zmin_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','Z min',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(9)  text_size(1) text_size(2)]);
h_sliders.Zmax_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','Z max',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(10)  text_size(1) text_size(2)]);
h_sliders.Dect_thresh_slider_txt = uicontrol(h_sliders.fig,'Style','text',...
                'String','Det thresh, nm',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'HorizontalAlignment','left',...
                'FontSize',10,...
                'Position',[slider_x(1) top-displine(11)  text_size(1) text_size(2)]);
            
% edit

h_sliders.Imin = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(1)  edit_size(1) edit_size(2)]);
h_sliders.Imax = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(2)  edit_size(1) edit_size(2)]);
h_sliders.Frmin = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(3)  edit_size(1) edit_size(2)]);
h_sliders.Frmax = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(4)  edit_size(1) edit_size(2)]);
h_sliders.Xmin = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(5)  edit_size(1) edit_size(2)]);
h_sliders.Xmax = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(6)  edit_size(1) edit_size(2)]);
h_sliders.Ymin = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(7)  edit_size(1) edit_size(2)]);
h_sliders.Ymax = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(8)  edit_size(1) edit_size(2)]);
h_sliders.Zmin = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'FontSize',8,...
                'String','0',...
                'Position',[slider_x(3) top-displine(9)  edit_size(1) edit_size(2)]);
h_sliders.Zmax = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'String','0',...
                'FontSize',8,...
                'Position',[slider_x(3) top-displine(10)  edit_size(1) edit_size(2)]);            
h_sliders.detect_thresh = uicontrol(h_sliders.fig,'Style','edit',...
                'BackgroundColor',backgroundcolor,...
                'ForegroundColor',textcolor,...
                'String','100',...
                'Position',[slider_x(3) top-displine(11)  edit_size(1) edit_size(2)]);            

            
end


%% callbacks
function vPALM2_sliders_callbacks(h_sliders) 

set(h_sliders.Imin_slider,'callback',{@Imin_slider,h_sliders});
set(h_sliders.Imax_slider,'callback',{@Imax_slider,h_sliders});
set(h_sliders.Frmin_slider,'callback',{@Frmin_slider,h_sliders});
set(h_sliders.Frmax_slider,'callback',{@Frmax_slider,h_sliders});
set(h_sliders.Xmax_slider,'callback',{@Xmax_slider,h_sliders});
set(h_sliders.Xmin_slider,'callback',{@Xmin_slider,h_sliders});
set(h_sliders.Ymin_slider,'callback',{@Ymin_slider,h_sliders});
set(h_sliders.Ymax_slider,'callback',{@Ymax_slider,h_sliders});
set(h_sliders.Zmin_slider,'callback',{@Zmin_slider,h_sliders});
set(h_sliders.Zmax_slider,'callback',{@Zmax_slider,h_sliders});
set(h_sliders.detect_thresh_slider,'callback',{@detect_thresh_slider,h_sliders});
set(h_sliders.detect_thresh,'callback',{@detect_thresh,h_sliders});
set(h_sliders.Imin,'callback',{@Imin,h_sliders});

end

%% functions

function newclosefunction(hObject, eventdata)
disp('Remember to close this GUI using the main vPALM window!');
end


function Imin_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Imin,'String',num2str(get(h_sliders.Imin_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end


function Imin(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Imin_slider,'Value',str2num(get(h_sliders.Imin,'String')));
%     plot_localizations_2d(hObject,eventdata,h)
end


function Imax_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Imax,'String',num2str(get(h_sliders.Imax_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end



function Frmin_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Frmin,'String',num2str(floor(get(h_sliders.Frmin_slider,'Value'))));
%     plot_localizations_2d(hObject,eventdata,h)
end



function Frmax_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Frmax,'String',num2str(floor(get(h_sliders.Frmax_slider,'Value'))));
%     plot_localizations_2d(hObject,eventdata,h)
end



function Xmax_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Xmax,'String',num2str(get(h_sliders.Xmax_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end



function Xmin_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Xmin,'String',num2str(get(h_sliders.Xmin_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end



function Ymax_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Ymax,'String',num2str(get(h_sliders.Ymax_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end



function Ymin_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Ymin,'String',num2str(get(h_sliders.Ymin_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end



function Zmin_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Zmin,'String',num2str(get(h_sliders.Zmin_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end

function Zmax_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.Zmax,'String',num2str(get(h_sliders.Zmax_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)


end

function detect_thresh_slider(hObject, eventdata, h_sliders)
    h = get(h_sliders.fig, 'UserData');  
    set(h_sliders.detect_thresh,'String',num2str(get(h_sliders.detect_thresh_slider,'Value')));
%     plot_localizations_2d(hObject,eventdata,h)
end