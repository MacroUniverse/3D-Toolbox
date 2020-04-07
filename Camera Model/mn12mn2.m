%把cam1相片上的点重新投影到cam2上面; 
%cam1与cam2位置相同, 其他都可以不同. 

function mn2=mn12mn2(mn1,cam1,cam2)

%生成cam1坐标系中的矢量
vcam1=mn2vcam(mn1,cam1);

%矢量从cam1系中变换到cam2系中
vcam2=vcam12vcam2(vcam1,cam1,cam2);

%变成cam2相片中上的点
mn2=vcam2mn(vcam2,cam2);

end