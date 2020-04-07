%spatial2mn的反函数(不参考cc,参考mn2spatial)



function varargout=mn2spatial2(m,n,cam)

cc(1)=cam(6,1)/2+0.5; %水平方向
cc(2)=cam(6,2)/2+0.5; %垂直方向

if nargin==3
varargout{1}=m+cc(1);
varargout{1,2}=n+cc(2);
else
mn=m;
xy(:,1)=mn(:,1)+cc(1);
xy(:,2)=mn(:,2)+cc(2);
varargout{1}=xy;

end


end