%一个相机(参考系)中的矢量, 转换到另一个相机(参考系)中的矢量. 两个相机(参考系)原点相同.
%size=[N,3];
function vcam2=vcam12vcam2(vcam1, cam1, cam2)

Matrix=cam2(1:3,:)*cam1(1:3,:)'; %两个变换矩阵合成: 先vcam1到vloc, 再vloc到vcam2
vcam2=(Matrix*vcam1')';

end