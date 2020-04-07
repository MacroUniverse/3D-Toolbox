%更新视野框(如果有输入,则画出cam的视野框,否则画出当前axes的视野框)
%输出视野框的句柄,以后可删除
%size(h)=[1 2];

function h=showcamDomain(cam,t)

timer=0;%计时器关闭
if nargin==0
    cam=axes2cam;
elseif  nargin==1 && numel(cam)==1
    t=cam;
    cam=axes2cam;
    timer=1;
elseif nargin==2
    timer=1;
end

%画出3D矩形框
alpha=cam(6,1); beta=cam(6,2);
load Calib_Results cc; 
Xc=cc(1)-alpha/2; Yc=cc(2)-beta/2;
mn=[-alpha/2,-beta/2; alpha/2,-beta/2; alpha/2,beta/2; -alpha/2,beta/2]-[Xc,Yc;Xc,Yc;Xc,Yc;Xc,Yc];
v=mn2vcam(mn,cam);
Cos=v*[0;0;1];
mag=1./Cos;
mag=mag*20;%为了不显示错误,框框远一点好了
L=mn2Lloc(mn,cam);
P=LR2P(L,mag);
P=[P; P(1,:)];%闭合曲线,最后一个点是第一个点
h(1)=Plot3(P,'LineWidth',2);
Pt=P(1,:)+0.1*(P(1,:)-P(4,:));%文字坐标
h(2)=Text(Pt,'相片效果');

%调整视角(好大)
ha=gca;
ViewAngle=get(ha,'CameraViewAngle');

figure(gcf);
%定时删除功能
if timer==1
    pause(t);
    delete(h(1));delete(h(2));
    set(ha,'CameraViewAngle',ViewAngle);%恢复原来视角
end

end
