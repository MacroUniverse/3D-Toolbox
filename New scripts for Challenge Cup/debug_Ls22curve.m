%debug_Ls22curve
if 0 %实验1

N1=2;
PX1=zeros(N1,3);
PX1(:,2)=[1 2];
N2=2;
PX2=zeros(N2,3);
PX2(:,2)=[0 4];

L1=zeros(N1,6);
P1=[0 0 10];
for ii=1:N1
    L1(ii,:)=P22L(P1,PX1(ii,:));
end
L2=zeros(N2,6);
P2=[10 0 0];
for ii=1:N2
    L2(ii,:)=P22L(P2,PX2(ii,:));
end

if 0
setfigure 3D
plotL3(L1,15);
plotL3(L2,15);
end
curve=Ls22curve(L1,L2);

end


%实验2
cam1=setcam(0,0,10,'cart','H50');
cam2=setcam(10,0,0,'cart','H50');
setfigure 3D;
showcam(cam1,3);
showcam(cam2,3);
setfigure H50;
mn1=ginput;
mn2=ginput;
L1=mn2Lloc(mn1,cam1);
L2=mn2Lloc(mn2,cam2);
close
plotL3(L1,15); plotL3(L2,15);
curve=Ls22curve(L1,L2);

if numel(curve)>0
Plot3(curve)
else
    disp('没有相交曲线');
end

%结果非常成功!
