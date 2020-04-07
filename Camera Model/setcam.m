%相机参数初始化
%以下是默认值,第二行适用于Nokia N97主相机
%phi=pi/5; theta=pi/5; dist=5;
%alpha=1; beta=0.75; xi=1;


function cam=setcam(phi,theta,r,sph_cart,camera)


if nargin==1 %如果没有输入,phi,theta,r取默认,转到球坐标法计算cam33,Pcam
    camera=phi;
    phi=pi/5;
    theta=pi/6;
    r=5;
    sph_cart='sph';
end

if nargin==0
   error('please enter at least the camera name');
elseif nargin==3
    error('please enter the camera name');
end

if strcmp(sph_cart,'cart') %直角坐标计算cam33,Pcam
    if phi==0&&theta==0
    i=[0 -1 0];
    else
    i=vunit([theta,-phi,0]);
    end
    k=vunit([-phi,-theta,-r]);
   
    j=cross(k,i);
    cam33=[i(:)';j(:)';k(:)'];
    Pcam=[phi,theta,r];
    
elseif strcmp(sph_cart,'sph') %球坐标计算cam33,Pcam
   k=zeros(1,3);
   [k(1),k(2),k(3)]=sph2cart(theta,pi/2-phi,1);
   k=-k;
   i=[sin(theta), -cos(theta), 0];
   j=cross(k,i);
   cam33=[i; j; k];
   Pcam=-cam33(3,:)*r;
end

    Ploc=vloc2vcam(-Pcam,cam33);

if ~exist(camera,'var')
    camera='H50';
end
if strcmp(camera,'N97')
    alpha=2592;   %相片水平像素,N97
    beta=1944 ;    %相片垂直像素,N97
    xi=2405.9;  %N97;
elseif strcmp(camera,'H50')
    alpha=848;
    beta=480;
%     load Calib_Results fc
%     xi=mean(fc);
   xi=1380;
end
    
    %按格式合并
    
                                                                               %根据新的mn格式, 特此修改
                                                                               cam33(1,:)=-cam33(1,:);
                                                                               cam33(2,:)=-cam33(2,:);
                                                                              %%%%%
    
                                                                             
    cam=[cam33;Pcam;Ploc;alpha,beta,xi];
end