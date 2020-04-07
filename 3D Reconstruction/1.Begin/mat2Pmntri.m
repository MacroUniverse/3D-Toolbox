%由方阵的轮廓点生成Pmntri(若不是放方阵,请在程序中修改长宽)
%方阵每条边有n+1个点, 轮廓上共有4n个点
%输入输出是同种坐标(mn)


function Pmntri=mat2Pmntri(X,Y)

dL1=1.5198;%x轴每格的长度(厘米)
dL2=1.5231;%y轴每格的长度(厘米)

%构建Pmn矩阵
Size=size(X);
[ind,sub]=matC(Size);
Np=size(sub,1);
Pmn=zeros(Np,5);
Pmn(:,[1 2])=[sub(:,1)-1, sub(:,2)-1];
Pmn(:,1)=Pmn(:,1)*dL1;
Pmn(:,2)=Pmn(:,2)*dL2;
Pmn(:,3)=0;
Pmn(:,[4 5])=[X(ind) Y(ind)];

%构建Pmntri矩阵
Ntri=floor(Np/3);
temp=(1:Ntri)';
Order=[temp temp+Ntri temp+2*Ntri];
Pmntri=Pmn2Pmntri(Pmn,Order);

end