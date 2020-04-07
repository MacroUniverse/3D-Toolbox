%图片上点若干点中,取四点制作Pmn4用于相机初步定位
%1.先确定平均位置
%2.确定离平均位置最远的一点P1
%3.确定P1最左边一点P2
%4.确定P2最左边一点P3
%5.确定P3最左边一点P4

function [mn4,Dname]=mnpick4(mnii)
N=size(mnii,1);
if N<4
    error('size(mmii,1)<4');
end
mn0=sum(mnii(:,1:2))/N;%中心平均点
mnr(:,1)=mnii(:,1)-mn0(1);%相对矢量
mnr(:,2)=mnii(:,2)-mn0(2);
mn4=zeros(4,2);%输出的四个点
Dname=zeros(4,1);%对应的i


max=0;
for ii=1:N
    mag=vmag(mnr(ii,:));
    if mag>max
        max=mag; 
        mark=ii;
    end
end
mn4(1,:)=mnii(mark,1:2);%第一个点
Dname(1)=mnii(mark,3);
vn2=[mnr(mark,2),-mnr(mark,1)];%第二点法向量
vn3=-mnr(mark,:);%第三点法向量
vn4=-vn2;%第四点法向量
mnr(mark,:)=[];%删掉该点避免重复
mnii(mark,:)=[];

max=0;
for ii=1:N-1
    mag=mnr(ii,:)*vn2';
    if mag>max
        max=mag;
        mark=ii;
    end
end
mn4(2,:)=mnii(mark,1:2);%第二个点
Dname(2)=mnii(mark,3);
mnr(mark,:)=[];%删掉该点避免重复
mnii(mark,:)=[];

max=0;
for ii=1:N-2
    mag=mnr(ii,:)*vn3';
    if mag>max
        max=mag;
        mark=ii;
    end
end
mn4(3,:)=mnii(mark,1:2);%第三个点
Dname(3)=mnii(mark,3);
mnr(mark,:)=[];
mnii(mark,:)=[];

max=0;
for ii=1:N-3
    mag=mnr(ii,:)*vn4';
    if mag>max
        max=mag;
        mark=ii;
    end
end
mn4(4,:)=mnii(mark,1:2);%第四个点
Dname(4)=mnii(mark,3);

end