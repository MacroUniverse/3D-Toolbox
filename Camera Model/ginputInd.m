%由spatial坐标转换成矩阵的Ind索引(先xy轴交换,再取整)

function Ind=ginputInd(varargin)

%获取当前相片的尺寸信息
Size=photoSize;

if nargout>1
 error('目前最多允许2个变量输出,请进一步拓展该程序'); 
end

[x,y]=ginputSub(varargin{:});
Ind=sub2ind(Size,x,y);

end