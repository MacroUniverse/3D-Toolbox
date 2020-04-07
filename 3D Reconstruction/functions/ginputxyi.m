%用鼠标确定图片上已知点中的几个, 返回序号
%调用该程序以前, 先显示图片, 并且hold on
%size(mni)=[N,3]

function [i, mn]=ginputxyi(xyi,n)
N=size(xyi,1);
XY=xyi(:,[1 2]);%XY是已知点的spatial坐标
scatter(XY(:,1),XY(:,2),'r');
xy=ginput(n);
i=zeros(n,1); mn=zeros(n,2);
for ii=1:n %每循环处理一个取点
    for jj=1:N
        if vmag(xy(ii,:)-XY(jj,:))<5
            i(ii)=mni(jj,3);
            if nargout==2
                mn(ii,:)=mni(jj,[1 2]);
            end
            break
        end
    end
end
end