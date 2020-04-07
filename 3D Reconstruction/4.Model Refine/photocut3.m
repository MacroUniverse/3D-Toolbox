%正方形相片三角截图

function CData=photocut3(name,n)

I=imread(name);
h=figure;
imshow(I);
[i,j]=tricut(n);

p=zeros(3,2);
for ii=1:3
     input(['调整图片, 取第' num2str(ii) '个点 (ok:回车)']);
     figure(h);
     p(ii,:)=ginput(1);
end
redo=input('是否重做? (否: 回车; 是: 任意值)');
if ~isempty(redo)
    for ii=1:3
     input(['调整图片, 取第' num2str(ii) '个点 (ok:回车)']);
     figure(h)
     p(ii,:)=ginput(1);
    end
end
ex=(p(2,:)-p(1,:))/n;
ey=(p(3,:)-p(1,:))/n;
P=i(:)*ex+j(:)*ey+repmat(p(1,:),3*n^2,1);
CData=zeros(n^2,3);
for ii=1:n^2
    Pc=sum(P(3*ii-2:3*ii,:))/3;
    CData(ii,:)=I(round(Pc(1)),round(Pc(2)),:);
end

CData=CData/256;
end

