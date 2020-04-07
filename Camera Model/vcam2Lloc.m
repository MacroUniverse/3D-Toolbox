%相机系中的矢量转换本地6参数L
function Lloc=vcam2Lloc(vcam,cam)
N=size(vcam,1);
vloc=vcam2vloc(vcam,cam);
vloc=vunit(vloc);
P=repmat(cam(4,:),N,1);
Lloc=[P vloc];
end