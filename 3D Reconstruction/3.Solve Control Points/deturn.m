%除去转动,只保留平移
%即,求出x,y,theta,使camturn(V2,x,y,theta)与V1对应向量组成的平面都交于
%同一条直线

%size(V1)=size(V2)=[N,3];


function [x,y,theta,E]=deturn(V1,V2,var0)

hf=@(var) f(V1,V2,var);
if nargin<3
    var0=[0 0 0];
end
var=fminsearch(hf,var0);
x=var(1); y=var(2); theta=var(3);
E=f(V1,V2,var);

end

%转动V2直到V2(ii,:)与V1(ii,:)决定的平面(Pi全部较于一条线);
%size(V1)=size(V2)=[N,3];

%m文件版本为deturntrial.m
function E=f(V1,V2,var)
%转动V2直到V2(ii,:)与V1(ii,:)决定的平面(Pi全部较于一条线);
%size(V1)=size(V2)=[N,3];
x=var(1); y=var(2); theta=var(3);

N=size(V1,1);
%特殊转动函数(相机自旋,镜头偏向)
V2=camturn(V2,x,y,theta);

%纯平移判定
Vn=cross(V1,V2,2);
E=0;
for ii=1:4:size(Vn)-3%用两对法向量判断共面
    temp1=cross(Vn(ii,:),Vn(ii+1,:));
    temp2=cross(Vn(ii+2,:),Vn(ii+3,:));
    temp=vang(temp1,temp2);
    if temp>pi/2
        temp=pi-temp;
    end
    E=E+temp;
end
E=E/N;

%函数围栏
R=1;
r=vmag([x,y,theta]);
if r>R
    E=E+(r-R)*0.01;
end

E=log(E+3.720075976020795e-44);
end 