%计算两点mn的夹角
%只需用到cam(6,3)

function ang=mn22ang(mn1,mn2,cam)

xi=repmat(cam(6,3),size(mn1,1),1);
ang=vang([mn1,xi],[mn2,xi]);

end
