%转动V2直到V2(ii,:)与V1(ii,:)决定的平面(Pi全部较于一条线);
%size(V1)=size(V2)=[N,3];

function E=deturntrial(V1,V2,x,y,theta)

N=size(V1,1);
%特殊转动函数(相机自旋,镜头偏向)
V2=camturn(V2,x,y,theta);

%纯平移判定
Vn=cross(V1,V2,2);
E=0;
for ii=1:4:size(Vn)-3%用两对法向量判断共面
    temp1=cross(Vn(ii,:),Vn(ii+1,:));
    temp2=cross(Vn(ii+2,:),Vn(ii+3,:));
    temp=vang(temp1,temp2);
    if temp>pi/2
        temp=pi-temp;
    end
    E=temp+E;
end
E=E/N;

%函数围栏
R=1;
r=vmag([x,y,theta]);
if r>R
    E=E+(r-R)*0.01;
end

E=log(E+3.720075976020795e-44);

end 