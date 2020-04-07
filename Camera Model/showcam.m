%画出相机在loc系中的位置及方向
%在setfigure('3D')函数生成的坐标系中画
%如果输入三个参数, 就进行cc修正, 否则不修正;

function showcam(cam,Size,~)

alpha=cam(6,1);
beta=cam(6,2);
Pcam=cam(4,:);

if nargin>2
    load Calib_Results cc
    Xc=cc(1)-alpha/2; Yc=cc(2)-beta/2;
else
    Xc=0; Yc=0;
end


%画出ij矢量方向
Li=[Pcam,cam(1,:)];
Lj=[Pcam,cam(2,:)];
plotL3(Li,Size/3,'LineWidth',2);
plotL3(Lj,Size/3,'LineWidth',2);

%画出投影范围(四棱锥)
mn=[-alpha/2,-beta/2; alpha/2,-beta/2; alpha/2,beta/2; -alpha/2,beta/2]-[Xc,Yc;Xc,Yc;Xc,Yc;Xc,Yc];
L=mn2Lloc(mn,cam);
P=zeros(5,3);
vz=cam(3,:);
for ii=1:4
v=L(ii,4:6);
Len=Size/dot(v,vz);
P(ii,:)=L(ii,1:3)+L(ii,4:6)*Len;
end
P(5,:)=P(1,:);
for ii=1:4
temp=[Pcam; P(ii,:); P(ii+1,:)];
X=temp(:,1); Y=temp(:,2); Z=temp(:,3);
fill3(X,Y,Z,'r');
end

X=P(1:4,1);
Y=P(1:4,2);
Z=P(1:4,3);
fill3(X,Y,Z,'b');
    
end