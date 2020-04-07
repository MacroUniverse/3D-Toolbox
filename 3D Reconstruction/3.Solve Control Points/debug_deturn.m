 %deturn函数的调试

 %1.建立4个Ploc点
setfigure 3D
P=[0 0 0; 1 0 0; 1 1 0; 0 1 0;0 0 1; 1 0 1; 1 1 1; 0 1 1];
Plot3(P);
%2.手动确定两个cam
%input('第1个相机位置. ok:[ ]');
%cam1=axes2cam;
%input('第2个相机位置. ok:[ ]');
%cam2=axes2cam;
load temp cam1 cam2
%3.计算正确答案
[x12,y12,theta12]=cam22camturn(cam1,cam2);
[x21,y21,theta21]=cam22camturn(cam2,cam1);
disp('正确答案为:(x y theta)');
disp([x12; y12; theta12]);

%画出模拟相片
mn1=Ploc2mn(P,cam1);
setfigure H50; Scatter(mn1);
mn2=Ploc2mn(P,cam2);
setfigure H50; Scatter(mn2);

V1=Ploc2vcam(P,cam1);
V2=Ploc2vcam(P,cam2);
cam3=cam2;
cam3(1:3,:)=camturn(cam2(1:3,:),x21,y21,theta21,cam2);%相机2转到相机1的方向
V3=camturn(V2,x12,y12,theta12);
L1=vcam2Lloc(V1,cam1);
L2=vcam2Lloc(V2,cam2);
L3=vcam2Lloc(V3,cam3);

%2.deturn
t=0:pi/6:2*pi;
x=cos(t)*0.03; y=sin(t)*0.03; theta=0;
min=inf;
for ii=1:numel(x)
[x(ii),y(ii),theta(ii),temp]=deturn(V1,V2,[x(ii) y(ii) 0]);
if temp<min
    min=temp;
    ind=ii;
end
end
x0=x(ind); y0=y(ind); theta0=theta(ind);

%画图
X=linspace(-0.1,0,100);
Y=linspace(0,0.1,100);
[X,Y]=meshgrid(X,Y);
Z=zeros(size(X));
for ii=1:numel(X,Y)
    Z(ii)=deturntrial(V1,V2,X(ii),Y(ii),theta12);
end
%Z=log(Z+0.01);
setfigure 3D
surf(X,Y,Z);


