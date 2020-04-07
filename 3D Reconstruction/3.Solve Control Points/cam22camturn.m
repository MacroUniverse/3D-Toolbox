%已知cam1和cam2,求camturn参数x,y,turn使cam1能转动到cam2
%cam1用到全部参数,cam2只用到前三行
%2012/8/29与camturn一起实验验证
function [x,y,theta]=cam22camturn(cam1,cam2)
%思路:先找xy,根据xy把cam1摆到跟cam2一样的方向再根据i矢量确定旋转
%1.找出xy
k21=vloc2vcam(cam2(3,:),cam1);
x=k21(1)/k21(3); y=k21(2)/k21(3);

%2.找出theta
cam3=camturn(cam1(1:3,:),x,y,0,cam1);
i3=cam3(1,:); i2=cam2(1,:);
temp=cross(i3,i2);
mag=vmag(temp);
if mag==0%共线
    if i2*i3'>0%相同
        theta=0;
    else%相反
        theta=pi;
    end
elseif cam3(3,:)*temp'>0%顺时针[0 pi]
    theta=asin(mag);
else%逆时针[0 pi]
    theta=-asin(mag);
end

end