%给一个三角平面贴图
%把大三角切割成n^2个小三角(每条边分成n份),再用CData给小三角上色
%彩色: size(CData)=(n^2,3); %黑白: size(CData)=(n^2,1);

function texture3(p1,p2,p3,CData)
n=sqrt(size(CData,1));
[i,j]=tricut(n);
ei=(p2-p1)/n;
ej=(p3-p1)/n;
P=i(:)*ei+j(:)*ej+repmat(p1,3*n*n,1);
X=zeros(3,n^2); Y=X; Z=X;
X(:)=P(:,1); Y(:)=P(:,2); Z(:)=P(:,3);
for ii=1:n^2
    fill3(X(:,ii),Y(:,ii),Z(:,ii),CData(ii,:),'EdgeColor','none');
end
end