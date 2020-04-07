%deturn的真实实验(使用挑战杯积木模型的数据)
%别人的东西永远也不是你的...尤其是别人的程序

load begin_cams mni
mn1=mni{1}(:,1:2);
mn2=mni{2}(:,1:2);
cam=setcam('H50');
V1=mn2vcam(mn1,cam);V1=V1(1:20,:);
V2=mn2vcam(mn2,cam);V2=V2(1:20,:);

%%%%%%%%哎...不管你怎样解都好了....我继续往下
x=[-0.01 -0.05 -0.1 -0.5];
Emin=inf;
for ii=1:numel(x)
    [x,y,E]=deturn(V1,V2,[x(ii),0,0]);
    if E<Emin,E=Emin;ind=ii;end
end
%%%%%%%%哎...不管你怎样解都好了...我继续往下


