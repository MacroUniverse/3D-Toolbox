%显示指定相机的相片边框
function showframe(cam)

load Calib_Results.mat cc %cc是相片上中点的mn坐标

%获取相机数据
if nargin<1
    cam=setcam('H50');
end
alpha=cam(6,1); beta=cam(6,2); xi=cam(6,3);

%获取axes数据
ha=gca;
axis equal;
set(ha,'Units','pixels');%归一化单位
pos=get(ha,'Position');
x=pos(3)/2; y=pos(4)/2; %axes的一半长度,一半高度
pc=pos([1 2])+pos([3 4])/2;%axes的中心位置

%矩形框的位置
x1=x; y1=x/alpha*beta; 
%归一化的CC,并且转换为y轴向上的坐标
dc(1)=(cc(1)/alpha-1/2)*2*x1; dc(1,2)=(1/2-cc(2)/beta)*2*y1;
pc1=pc-dc;
pos1=[pc1(1)-x1 pc1(2)-y1 2*x1 2*y1];

%显示矩形框
annotation('rectangle','Units','pixels','Position',pos1);

%调整视角
tanA=beta/2/xi;
ang=2*atan(tanA/y1*y)/pi*180;
set(ha,'CameraViewAngle',ang);

%注释 
pos2=[pc1(1)-x1 pc1(2)+y1*1.25 0 0] ;
annotation('textbox','Units','pixels','Position',pos2,'String','相片效果','LineStyle','none');


end