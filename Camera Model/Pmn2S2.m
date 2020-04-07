%把三维点投影到相片上,与特征点间的方差+标准差

function [S2 S]=Pmn2S2(P,mn, cam, photo_name)

N=size(P,1);
mn1=Ploc2mn(P,cam);
temp=mn1-mn;
S2=sum(temp(:).^2)/N;

S=sqrt(S2);

if nargin==4
    I=imread(photo_name); figure;  imshow(I); hold on;
    title(['绿点:特征点 红点:重投影点 蓝箭头:1像素 红箭头/蓝箭头:误差像素 S=' num2str(S)]);
    xy=mn2spatial(mn);
    xy1=mn2spatial(mn1);
    Scatter(xy,20,'filled','r');
    Scatter(xy1,21,'g');
    for ii=1:N
        v=(xy1-xy)*50;
        v1=vunit(xy1-xy)*50;%1个像素*100
        quiver(xy(:,1),xy(:,2),v1(:,1),v1(:,2),0,'b','LineWidth',1.5);
        quiver(xy(:,1),xy(:,2),v(:,1),v(:,2),0,'r','LineWidth',1.5);

    end
end

end