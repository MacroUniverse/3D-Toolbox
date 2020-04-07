%整个cam(1:4,:)一起最优化的程序(条件:画面点方差最小);
%首先编出这个方差关于6个参数的函数
%size(P)=[N,3]; size(mn)=[N,2];


function [cam, Perr, angerr, S2]=cam_modi(Pmn,cam)

N=size(Pmn,1);
h=@(vars) f(vars,Pmn,cam,N);
vars=fminsearch(h, [0 0 0 0 0 0]);
x=vars(1); y=vars(2); z=vars(3); m=vars(4); n=vars(5); theta=vars(6);
cam(4,:)=cam(4,:)+[x y z];
cam(1:3,:)=camturn(cam(1:3,:),m,n,theta);
S2=f(vars,Pmn,cam,N);

angerr=S2/cam(6,3);%相机角误差
Perr=angerr*vmag(mean(Pmn(:,1:3))-cam(4,:));%相机位置误差

end

%平方差函数
function S2=f(vars, Pmn,cam, N)

P=Pmn(:,1:3); mn=Pmn(:,4:5);
x=vars(1); y=vars(2); z=vars(3); m=vars(4); n=vars(5); theta=vars(6);

cam(4,:)=cam(4,:)+[x y z];
cam(1:3,:)=camturn(cam(1:3,:),m,n,theta);

mn1=Ploc2mn(P,cam);
temp=mn1-mn;
S2=sum(temp(:).^2)/N;

end