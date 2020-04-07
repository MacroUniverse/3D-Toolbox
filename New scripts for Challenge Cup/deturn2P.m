%已知基线的向量为Axis0(从cam1方向指向cam2方向)
%把cam1安置在零点,指向y轴,cam2根据Axis0,距离cam1一个单位长度安置.
%输入原始的V1和进行deturn以后的V2.size(V1)=size(V2)=[N,3];
%输入空间中的点的坐标

function [P,h]=deturn2P(V1,V2,Axis)

cam1=setcam(0,-1,0,'cart','H50');cam1(4,:)=[0 0 0];
L1=vcam2Lloc(V1,cam1);
cam2=cam1; cam2(4,:)=Axis;
L2=vcam2Lloc(V2,cam2);
[P,h]=L22P(L1,L2);

end