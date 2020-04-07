%ViewAngle的原理测试

setfigure 3D
ha=gca;
set(ha,'CameraPosition',[0 0 10],'CameraTarget',[0 0 0],'CameraViewAngle',60);
position=get(ha,'Position');
annotation('rectangle',position);
r=10*tan(pi/6);
t=0:0.01:2*pi;
X=r*cos(t); Y=r*sin(t); Z=zeros(size(X));
plot3(X,Y,Z)