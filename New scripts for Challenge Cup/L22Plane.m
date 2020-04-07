%找到与L1,L2平行的平面, 经过L1(1:3)与L2(1:3)的中点
function Plane=L22Plane(L1,L2)
P=(L1(:,1:3)+L2(:,1:3))/2;
n=vunit(cross(L1(:,4:6),L2(:,4:6),2));
Plane=[P n];
end