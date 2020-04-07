%peak实验
%Z=peaks(30)/4;
[X,Y]=ndgrid((-5:4)*3);
R=(sqrt(X.^2+Y.^2)+eps)/4;
Z=4*sin(R)./R;
P=[X(:),Y(:),Z(:)];

setfigure 3D
h=surf(X,Y,Z); shading interp;
set(h,'CData',ones(10,10)/2);
colormap gray
lighting flat
cam1=setcam(pi/3,pi/5,70,'sph','H50');
cam1(1:3,:)=camturn(cam1(1:3,:),0,0.1,0,cam1);
cam2=cam1; cam2(4,:)=cam2(4,:)+[-15 10 0];
cam2(1:3,:)=camturn(cam2(1:3,:),-0.3,0,-0.1,cam2);
showcam(cam1,5);
showcam(cam2,5);

mn1=Ploc2mn(P,cam1);
mn2=Ploc2mn(P,cam2);

setfigure H50; title('1');
for ii=1:10:100
Plot(mn1(ii:ii+9,:));
end
for ii=1:10
Plot(mn1(ii:10:ii+90,:));
end
setfigure H50;title('2');
for ii=1:10:100
Plot(mn2(ii:ii+9,:),'-');
end
for ii=1:10
Plot(mn2(ii:10:ii+90,:));
end

%%%%%%%%%%%%%%%%下面是调试阶段
[x0,y0,theta0]=cam22camturn(cam1,cam2);%正确的答案
V1=mn2vcam(mn1,cam1);
V2=mn2vcam(mn2,cam2);
[Axis,V3,E]=deturn_process(V1,V2,x0,y0,theta0);

cam11=setcam(0,-1,0,'cart','H50');cam11(4,:)=[0 0 0];
cam22=cam11; cam22(4,:)=vcam2vloc(Axis,cam11);

L1=vcam2Lloc(V1,cam11);
L3=vcam2Lloc(V3,cam22);
P=L22P(L1,L3);
setfigure 3D


X1=zeros(10,10);Y1=X1;Z1=X1;
X1(:)=P(:,1);Y1(:)=P(:,2);Z1(:)=P(:,3);
surf(X1,Y1,Z1,'CData',ones(10,10)/2);colormap gray;
shading flat
lighting flat

showcam(cam11,0.5);showcam(cam22,0.5);
Plot3([cam11(4,:); cam22(4,:)],'LineWidth',2)

