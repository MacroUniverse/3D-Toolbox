%求射线跟点法式平面的交点
%目前只支持一线一面
%size(L)=[1 6];
%size(Plane)=[1 6];
function P=LPlane2P(L,Plane)

P1=L(1:3); P2=Plane(1:3);
V=P2-P1;
e=L(4:6); n=Plane(4:6);
R=dot(V,n)/dot(e,n);
P=LR2P(L,R);

end