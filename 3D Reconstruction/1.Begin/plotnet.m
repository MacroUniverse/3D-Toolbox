%矩形平面点阵连线
%由于某些程序需要, 只负责画图
%可以输入plot后面的任意设置
%可以用board生成标定板的x,y,输入该函数,画出标定板
function plotnet(X,Y,varargin)
hold on
N1=size(X,1);
N2=size(X,2);
for ii=1:N1
  plot(X(ii,:),Y(ii,:),varargin{:});
end
for ii=1:N2
  plot(X(:,ii),Y(:,ii),varargin{:});
end

end