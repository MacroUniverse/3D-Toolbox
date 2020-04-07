%读取棋盘点阵,确定相机位置,给出误差
%棋盘规格由当前的board.mat确定

function [cam,Perr,angerr]=board2cam(nth)

disp(['处理第' num2str(nth) '张相片...']);
cam=setcam('H50');

%读取棋盘点阵
Name=['begin_rect' num2str(nth) '_corners.mat'];
load(Name);


%画出理论棋盘
[X,Y,Z]=board;
setfigure 3D
plotboard(X,Y);


%计算相机位置
[m,n]=spatial2mn(x,y);  %mn的总源头,可以在这个程序里修正mn误差
ind=[1; 11; 121; 111];%四个角的sub2ind

Pmn4=[X(ind),Y(ind),Z(ind),m(ind),n(ind)];
cam=Pmn42cam(Pmn4,cam);
Pmn=[X(:),Y(:),Z(:),m(:),n(:)];
[cam,Perr,angerr]=cam_modi(Pmn,cam);

end



