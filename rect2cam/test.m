P = [
    0     0     0
     0    16     0
     0    16     9
     0     0     9];

mn = [
    -271.7500   85.2500
  302.7500  308.7500
  337.2500 -201.2500
 -337.7500 -255.2500];

Pmn4 = [P mn];


l12 = p22l(mn(1,:), mn(2,:));
l23 = p22l(mn(2,:), mn(3,:));
l34 = p22l(mn(3,:), mn(4,:));
l41 = p22l(mn(4,:), mn(1,:));

mnx = l22p(l12,l34);
mny = l22p(l23,l41);
f = sqrt(-mnx(1)*mny(1)-mnx(2)*mny(2));

vx = vunit([mnx(1), mnx(2), f]);
vy = vunit([mny(1), mny(2), f]);
vz = cross(vx, vy);

vcam = vunit([mn, [f;f;f;f]]);
origin = vcam(1,:);
v2 = vcam(2,:); v3 = vcam(3,:); v4 = vcam(4,:);
Plane = [origin, vz];
p2 = LPlane2P([0,0,0, v2],Plane);
p3 = LPlane2P([0,0,0, v3],Plane);
p4 = LPlane2P([0,0,0, v4],Plane);
