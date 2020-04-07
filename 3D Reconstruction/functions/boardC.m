%手动取标定板相片的四点(粗略),精确提取标定板外围格点
%输入的cam只用到cam(6,3),即xi

function Pmn=boardC(I,cam)

%1.手动取四点
xy4=zeros(4,2);
for ii=1:4
    temp=ginput(1);
    temp=board_corner(temp,I,7,7);
    Scatter(temp,'Marker','+','LineWidth',1.5,'CData',[1 0 0]);
    xy4(ii,:)=temp;
end
mn4=spatial2mn(xy4);

%2.计算格点初值
mnC=affine_C(mn4,cam);
xyC=mn2spatial(mnC);
Scatter(xyC,'Marker','square','LineWidth',1.5,'CData',[0 1 0]);
%3.精确定位格点
xyC=board_corner(xyC,I,7,7);
mnC=spatial2mn(xyC);
[X,Y,Z]=board;
P=[X(:),Y(:),Z(:)];
ind=matC(size(X));
PC=P(ind,:);
Pmn=[PC,mnC];

end