%更新视野框(如果有输入,则画出cam的视野框,否则画出当前axes的视野框)
%输出视野框的句柄,以后可删除
%size(h)=[1 2];
%name是相片的全名(不含后缀名),默认bmp格式
%t可选,t是自动删除的时间
%Size是相片离焦点的距离
function h=transparent_photo(cam,photoname,Size,t)

%计时器关闭
if nargin==4
    timer=1;
else
    timer=0;
end

%画出3D矩形框
alpha=cam(6,1); beta=cam(6,2);
load Calib_Results cc; 
Xc=cc(1)-alpha/2; Yc=cc(2)-beta/2;
mn=[-alpha/2,-beta/2; alpha/2,-beta/2; alpha/2,beta/2; -alpha/2,beta/2]-[Xc,Yc;Xc,Yc;Xc,Yc;Xc,Yc];
v=mn2vcam(mn,cam);
Cos=v*[0;0;1];
mag=1./Cos;
mag=mag*Size;%相片到焦点的距离
L=mn2Lloc(mn,cam);
P=LR2P(L,mag);%P是顺时针排序;

%显示透明相片
I=imread([photoname '.bmp']);
colormap gray;
h=Surf(P,[1 2; 4 3],'FaceColor','texturemap','CData',I,'FaceAlpha',0.6);


figure(gcf);%前置显示
%定时删除功能
if timer==1
    pause(t);
    delete(h(1));delete(h(2));
    set(ha,'CameraViewAngle',ViewAngle);%恢复原来视角
end

end
