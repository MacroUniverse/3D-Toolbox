%相机射线转换成本地射线方程
%mn支持size=[N,2]

function  L=mn2Lloc(mn,cam)
N=size(mn,1);
if N==1
    vcam=mn2vcam(mn,cam);
    L(1:3)=cam(4,:);
    L(4:6)=vcam2vloc(vcam,cam);
elseif N>1
    vcam=mn2vcam(mn,cam);
    L(:,1:3)=repmat(cam(4,:),N,1);
    L(:,4:6)=vcam2vloc(vcam,cam);
end

end