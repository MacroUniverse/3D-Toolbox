%simple example1

%计算
cam=setcam(10,10,5,'cart','H50');        %根据标定结果生成H50摄像头的
                                                         % 参数数组以及位置(摄像头默认指向原点)
mn=[60,30];                                       %相片上的坐标用mn表示(单位是像素)
L=mn2Lloc(mn,cam);                          %'Lloc'代表L-local, '2'代表to; L是点法式直线
Plane=[0 0 0, 0 0 1];                           %Plane是点法式平面,前三个是一点,后三个是法向量
P=LPlane2P(L,Plane);                        %生成直线与平面的交点
disp(['P=' P]);                                     %在控制窗显示结果

%可视化
setfigure H50                                     %生成空白的H50的相片(注意摄像头的光心并不一定是图心);
Scatter(mn); Text(mn,'  相片坐标(60,30)');%在相片上标记点(m,n)

setfigure 3D                                       %生成中心投影的空间坐标系
showcam(cam,3);                               %在坐标系中, 画出相机, 大小为3个单位
plotL3(L,20);                                       %画出射线, 长度为20单位
plotboard;                                           %在水平面上画出一块标定板
Scatter3(P);                                        %描出点P
Text(P,['   P=(' num2str(P) ')  ']);           %标注点P的坐标