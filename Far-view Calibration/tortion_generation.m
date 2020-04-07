%根据特定的算法扭曲相片
%N是操作流程, 例如[1 3 2]就是先进行操作1, 再进行操作2, 再进行操作3.
%注意cam要用到cam(6,:)

function mn=tortion_generation(mn,cam,N)

for ii=1:numel(N)
    switch N(ii)
        case 1, mn=f1(mn,cam);%1.中心偏移
        case 2, mn=f2(mn,cam);%2.径向畸变
        case 3, mn=f3(mn,cam);%3.不规则畸变
    end
end

end

%1.中心偏移
function mn=f1(mn,cam)

cam1=cam;
cam1(1:3,:)=camturn(cam(1:3,:),0.1,0.1,0, cam);
mn=mn12mn2(mn,cam,cam1);

end


%2.径向畸变
function mn=f2(mn,cam)

R=4*max(cam(6,1), cam(6,2));
r=sqrt(mn(:,1).^2+mn(:,2).^2);
temp=sin(r/R)*R;
mn=mn*temp;

end


%3.不规则畸变
function mn=f3(mn,cam)

x=mn(:,1)/cam(6,1)*4; y=mn(:,2)/cam(6,2)*4; %-2<x,y<2
dx=x.*exp(-x.^2)*exp(-y.^2)*0.2;
dy=x.*exp(-x.^2)*exp(-y.^2)*0.3;
x1=x+dx; y1=y+dy;
mn(:,1)=x1*cam(6,1)/4; mn(:,2)=y1*cam(6,2)/4;

end
