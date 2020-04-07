%1.先把V围绕Pcam,关于cam(3,:)右手转动theta角
%2.相机坐标[x,y,1]对应一个vloc,再由turn函数把矢量V从相机目前方向摆到vloc方向
%size(V)=[N,3];
%如果不输入cam,默认i=[1 0 0]; j=[0 1 0]; k=[0 0 1];cam(4,:)=[0 0 0];

%2012/8/29与cam22camturn一起实验验证

function V1=camturn(V,x,y,theta,cam)

%Vloc转到Vcam
if nargin==5
    Vcam=vloc2vcam(V,cam);
    vx=Vcam(:,1);vy=Vcam(:,2);vz=Vcam(:,3);
else
    vx=V(:,1); vy=V(:,2); vz=V(:,3);
end

%Vcam的camturn
[vx,vy,vz]=turn(vx,vy,vz,[0 0 1],theta);%先绕z轴旋转theta角
[vx,vy,vz]=turn(vx,vy,vz,[0 0 1],[x,y,1]);%再摆头

%逆转换到vloc
if nargin==5
    V1=vcam2vloc([vx,vy,vz],cam);
else
    V1=[vx,vy,vz];
end

end