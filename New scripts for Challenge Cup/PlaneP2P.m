%求平面上离P最近的点P1
function [P1,h]=PlaneP2P(Plane,P)
V=P-Plane(:,1:3);
h=dot(Plane(:,4:6),V);
P1=Plane(:,1:3)+V-Plane(:,4:6)*h;
end