%相片上的点转换为球面上的点

function [theta,phi]=mn2sphere(mn,cam)
vcam=mn2vcam(mn,cam);
vloc=vcam2vloc(vcam,cam);
[phi,theta]=cart2sph(vloc(:,1),vloc(:,2),vloc(:,3));
theta=pi/2-theta;
if nargout==1
    theta=[theta,phi];
end
end
