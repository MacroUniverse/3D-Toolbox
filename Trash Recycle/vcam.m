%生成cam33,相机由(phi,theta)指向原点,画面水平
%输入(phi,theta)或者Pcam的三个分量

function cam33=vcam(phi,theta,z)

if nargin==3
    if phi==0&&theta==0
    i=[0 -1 0];
    else
    i=vunit([theta,-phi,0]);
    end
    k=vunit([-phi,-theta,-z]);
   
    j=cross(k,i);
    cam33=[i(:)';j(:)';k(:)'];
    
else
   k=zeros(1,3);
   [k(1),k(2),k(3)]=sph2cart(theta,pi/2-phi,1);
   k=-k;
   i=[sin(theta), -cos(theta), 0];
   j=cross(k,i);
   cam33=[i(:)';j(:)';k(:)'];
end

end