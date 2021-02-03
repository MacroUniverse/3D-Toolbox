% orientation
% cam需用到Pcam和xi
% 输出只有 cam33 被修改
% 相机会把 mn1 精确瞄准 P1, mn2 和 P2 只是用于旋转

function cam=ori(Pmn2,cam)

Pcam=cam(4,:);
V1=Pmn2(1,1:3)-Pcam;
V2=Pmn2(2,1:3)-Pcam;

i=[1 0 0]; j=[0 1 0]; k=[0 0 1];

vcam=mn2vcam(Pmn2(:,[4 5]),cam);
v1=vcam(1,:);
v2=vcam(2,:);

v2=vturn(v2,v1,V1);
i=vturn(i,v1,V1);
j=vturn(j,v1,V1);
k=vturn(k,v1,V1);

n1=vunit(cross(V1,v2));
n2=vunit(cross(V1,V2));
sgn=sign(dot(cross(n1,n2),V1));
if sgn>=0
    theta=real(acos(dot(n1,n2)));
else 
    theta=2*pi-real(acos(dot(n1,n2)));
end
i=vturn(i,V1,theta);
j=vturn(j,V1,theta);
k=vturn(k,V1,theta);

cam(1:3,:)=[i;j;k];

end
