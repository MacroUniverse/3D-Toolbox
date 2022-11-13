# 3D-Toolbox
 本科挑战杯项目：多视角图片序列的三维重建
 完整文档见： 3D reconstruction toolbox.pdf

# TODO
* 整理出文档， 分享到 GitHub 上
* 不应该依赖于 MyMatlabLibrary

# 规范
* cam33 = [vx; vy; vz];
* cam = [vx; vy; vz; 相机原点位置; 世界原点位置; 照片横向分辨率; 照片纵向分辨率; 相机模型焦距]
* 相机坐标系： (m,n,k)  原点在图像中心， m 指向右, n 指向下, k 指向前
* ginput 得到的 i,j 如果是整数，那就是在从左上角起右边第 i 个像素下面第 j 个像素的中心
