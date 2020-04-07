%相机系中的矢量转换成本地系中的矢量
%支持size为(N,3)格式的vcam

function vloc=vcam2vloc(vcam,cam)

N=size(vcam,1);
if N==1
  vloc=zeros(1,3);
  vloc(1)=dot(vcam,cam(1:3,1));
  vloc(2)=dot(vcam,cam(1:3,2));
  vloc(3)=dot(vcam,cam(1:3,3));
elseif N>1
  vloc=zeros(size(vcam));
  x=cam(1:3,1);
  y=cam(1:3,2);
  z=cam(1:3,3);
  for n=1:N
    vcamn=vcam(n,:);
    vloc(n,1)=dot(vcamn,x);
    vloc(n,2)=dot(vcamn,y);
    vloc(n,3)=dot(vcamn,z);
  end
end

end