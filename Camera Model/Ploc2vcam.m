%本地点在相机系中的坐标
%要用到cam33和Ploc
function vcam=Ploc2vcam(D,cam)
N=size(D,1);
Pcam=cam(4,:);
Pcam=repmat(Pcam,N,1);
vloc=D-Pcam;
vcam=vloc2vcam(vloc,cam);
end