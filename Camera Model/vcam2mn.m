%相机矢量转换成有穷mn格式点
%支持size=[N,3]数组

function mn=vcam2mn(vcam,cam)

x=vcam(:,1);
y=vcam(:,2);
z=vcam(:,3);

mn=[x./z,y./z]*cam(6,3);

end