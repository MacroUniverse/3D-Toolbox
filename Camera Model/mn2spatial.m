%spatial2mn的反函数

function varargout=mn2spatial(m,n)

%H50的9点数据
load Calib_Results cc

if nargin==2
varargout{1}=m+cc(1);
varargout{1,2}=n+cc(2);
else
mn=m;
xy(:,1)=mn(:,1)+cc(1);
xy(:,2)=mn(:,2)+cc(2);
varargout{1}=xy;

end


end