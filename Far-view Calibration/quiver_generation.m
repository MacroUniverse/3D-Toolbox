%生成箭头的一段小程序

cam(6,1)=1280; cam(6,2)=720;
mn1=spatial2mn2(matched_points1,cam);
mn2=spatial2mn2(matched_points2,cam);
figure; Scatter(mn1)
view(0,-90);
hold on; Scatter(mn2,'r');
quiver(mn1(:,1),mn1(:,2),(mn2(:,1)-mn1(:,1))*4,(mn2(:,2)-mn1(:,2))*4);
