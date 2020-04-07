%转动第二组矢量，使两组矢量最大化对齐，返回误差。
function valign(mn1, mn2, xi)

cam1=[1 0 0; 0 1 0; 0 0 1; 0 0 0; 0 0 0; 0 0 xi];
%1.先选出两对矢量，用于粗略对齐
vcam1=mn2vcam(mn1,cam1);
Pmn2=[vcam1 mn2];
cam2=ori(Pmn2,cam1);

mn12=Ploc2mn(vcam1,cam2);

end