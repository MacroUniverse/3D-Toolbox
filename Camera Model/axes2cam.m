%从axes property中提取制作cam数组

function cam=axes2cam(ha)

if nargin<1
    ha=gca;
end

Pcam=get(ha,'CameraPosition');%相机位置
Target=get(ha,'CameraTarget');%相机目标
Vup=get(ha,'CameraUpVector');%相机上方向
%更新cam数组
cam=setcam('H50');
k=vunit(Target-Pcam);
i=vunit(cross(k,Vup));
j=cross(k,i);
cam(1:4,:)=[i;j;k;Pcam];

end