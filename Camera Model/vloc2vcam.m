%本地系矢量转换成相机系矢量
%支持size为(N,3)格式的vloc

function vcam=vloc2vcam(vloc,cam)

  vcam=vloc*cam(1:3,:)';

end