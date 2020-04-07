%运行完rectify函数以后,根据得到的结果生成世界坐标系中的点
%默认两台相机的位置分别为(-1,0,0)和(1,0,0)

function [P,h]=rectified2P(mnRect1,mnRect2)

cam=setcam(0,-1,0,'cart','H50');
cam1=cam;cam2=cam;
cam1(4,:)=[-1 0 0]; cam2(4,:)=[1 0 0];

Lloc1=mn2Lloc(mnRect1,cam1);
Lloc2=mn2Lloc(mnRect2,cam2);
[P,h]=L22P(Lloc1,Lloc2);

end