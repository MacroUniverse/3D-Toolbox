%在算出deturn的[x,y,theta]之后, 算出基线的方向矢量, 并给出
%基线的不确定度E(用弧度的方均根表示).
%返回的V2是V2进行camturn以后的向量组

%size(V1)=size(V2)=[N,3];

function [Axis0,V2,E]=deturn_process(V1,V2,x,y,theta)

N=size(V1,1);
%特殊转动函数(相机自旋,镜头偏向)
V2=camturn(V2,x,y,theta);

Vn=cross(V1,V2,2);
Axis=zeros(ceil(N/2),3);
for ii=1:2:size(Vn,1)-1%每一对矢量生成一个近似轴矢量
    Axis((ii+1)/2,:)=vunit(cross(Vn(ii,:),Vn(ii+1,:)));
end
NA=size(Axis,1);
for ii=2:NA
    if dot(Axis(ii,:),Axis(ii-1,:))<0
        Axis(ii,:)=-Axis(ii,:);
    end
end
Axis0=mean(Axis);
Atemp=repmat(Axis0,NA,1);
E=std(vang(Atemp,Axis));

%修正Axis的方向,使其有cam1指向cam2
%V1的方向[0 0 1]叉乘Vn的平均方向,应该等于Axis从cam1指向cam2的方向
temp=cross([0 0 1],mean(Vn));
if dot(temp,Axis0)<0, Axis0=-Axis0; end

end 