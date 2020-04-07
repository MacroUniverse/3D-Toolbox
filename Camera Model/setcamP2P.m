%相机参数初始化
%以下是默认值,第二行适用于Nokia N97主相机
%phi=pi/5; theta=pi/5; dist=5;
%alpha=1; beta=0.75; xi=1;

function cam=setcamP2P(Pcam,targ)

alpha=1;   %相片水平尺寸,N97
 beta=0.75;    %相片垂直尺寸,N97
xi=0.928205478006073;  %N97;


k=vunit(targ-Pcam);
kx=k(1); ky=k(2);

if kx==0&&ky==0
   i=[0 -1 0];
else
   i=vunit([ky,-kx,0]);
end

j=cross(k,i);
cam33=[i; j; k];

Ploc=vloc2vcam(-Pcam,cam33);

%按格式合并
cam=[cam33;Pcam;Ploc;alpha,beta,xi];

end