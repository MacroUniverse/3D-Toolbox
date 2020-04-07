%由spacial坐标转换到mn坐标
%注意!:加入了H50中心偏移(CC)矫正

function varargout=spatial2mn(x,y)

load Calib_Results cc

if nargin==2
varargout{1}=x-cc(1);
varargout{1,2}=y-cc(2);
else
xy=x;
mn(:,1)=xy(:,1)-cc(1);
mn(:,2)=xy(:,2)-cc(2);
varargout{1}=mn;

end


end