%由spatial坐标转换成矩阵的sub索引(先xy轴交换,再取整)

function varargout=ginputSub(varargin)

if nargout<=1
    varargout={round(fliplr(ginput(varargin{:})))};
elseif nargout==2
    [y,x]=ginput(varargin{:}); 
    x=round(x); y=round(y);
    varargout{2}=y; varargout{1}=x;
else
    error('目前最多允许2个变量输出,请进一步拓展该程序');    
end

end