%由spacial坐标转换到mn坐标(不参考cc修正,认为mn的原点在相片正中心. 参考spatial2mn)

function varargout=spatial2mn2(x,y,cam)

if nargin==3
    cc(1)=cam(6,1)/2+0.5; %水平方向
    cc(2)=cam(6,2)/2+0.5; %垂直方向
    varargout{1}=x-cc(1);
    varargout{1,2}=y-cc(2);
else
    xy=x; cam=y;
    cc(1)=cam(6,1)/2+0.5; %水平方向
    cc(2)=cam(6,2)/2+0.5; %垂直方向
    mn(:,1)=xy(:,1)-cc(1);
    mn(:,2)=xy(:,2)-cc(2);
    varargout{1}=mn;
end

end