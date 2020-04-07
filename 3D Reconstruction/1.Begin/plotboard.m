%矩形平面点阵连线
%由于某些程序需要, 只负责画图

%可以用board生成标定板的x,y,输入该函数,画出标定板
%当输入为零的时候,调用board函数(该函数读取board.mat)
function h=plotboard(X,Y)

hold on
if nargin==2
    N1=size(X,1);
    N2=size(X,2);
    Z=zeros(size(X));
else
    [X,Y,Z]=board;
    N1=size(X,1);
    N2=size(X,2);
end

h=surf(X,Y,Z);
Cdata=chessboard(N1,N2);
Cdata=double(Cdata);
Cdata=repmat(Cdata,[1,1,3]);
set(h,'Cdata',Cdata);

end