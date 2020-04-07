%本地坐标系的点Ploc转到相机坐标系中的点Pcam
%size(Ploc)=[N,3]; 
%cam为标准的相机数组,只需用到cam(1:4,:).

function Pcam=Ploc2Pcam(Ploc,cam)

vloc(:,3)=Ploc(:,3)-cam(4,3);
vloc(:,2)=Ploc(:,2)-cam(4,2);
vloc(:,1)=Ploc(:,1)-cam(4,1);

Pcam=vloc2vcam(vloc,cam);

end