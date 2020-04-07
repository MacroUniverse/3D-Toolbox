%mn式点转换成相机射线(单位矢量)
%输入mn式点和相机信息cam
%支持size(mn)=[N,2]

function v=mn2vcam(mn,cam)

N=size(mn,1);
if N==1
    v=f1(mn,cam);
elseif N>1
    v=zeros(N,3);
    for n=1:N
    v(n,:)=f1(mn(n,:),cam);
    end
end

end

function v=f1(mn,cam)
m=-mn(1);                                                           %根据新mn格式, 特别加一负号
n=mn(2);

if isinf(m) %无穷远点
   if isinf(n) %k=inf
      v=[0 1 0];
   else     %k~=inf
      k=n;
      if k>=0 %k>0
        x=-1/sqrt(1+k^2);
      else  %　ｋ<0
        x=1/sqrt(1+k^2);
      end
      y=sqrt(1-x^2);
      z=0;
      v=[x y z];
   end
else
    if vmag(mn)==0;     % 指向k
      v=[0 0 1];
    else    %正常
     v=vunit([-m,n,cam(6,3)]);
    end
end

end
