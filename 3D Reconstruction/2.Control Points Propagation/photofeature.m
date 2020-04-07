%显示照片和所有特征点详情及名称
%返回的xyi是已知3D坐标的特征点
%N是1个整数
%输出的mark是已知点在该图片的mnii中的行号.
%描点之后,画出曲线(如果有)

function [h,mark]=photofeature(prename,N)
Nphoto=numel(N); h=zeros(Nphoto,1); 
if Nphoto==1
    [h,mark]=photofeature1(prename,N); return;
end
mark=cell(Nphoto,1);
for ii=1:Nphoto
    [h(ii), mark{ii}]=photofeature1(prename,N(ii));
end
end

function [h,mark]=photofeature1(prename,N)

load begin_cams mni mnc
load Lerr2 DL

mnii=mni{N};

Iname=[prename num2str(N)];
I=imread([Iname '.bmp']);
h=figure('Name',Iname, 'NumberTitle', 'off'); 
imshow(I); hold on

if ~isempty(mni{N})
    mn=mnii(:,[1 2]); i=mnii(:,3);
    xy=mn2spatial(mn);
    scatter(xy(:,1),xy(:,2),4,'filled','b');
    text(xy(:,1)+3,xy(:,2),num2str(i));
    
    
    np=size(mnii,1); mark=false(np,1);
    for jj=1:np;%找出该图中已知空间坐标的特征点,并从中选取
        if isnan(DL(mnii(jj,3),1))
            continue
        end
        mark(jj)=true;
    end

    temp=mn2spatial(mnii(mark,[1 2]));
    scatter(temp(:,1), temp(:,2) ,5,'r');
else
    mark=[];
end


%画曲线
mncc=mnc{N};
if ~isempty(mncc)
    for ii=1:size(mncc,1)
        xy=mn2spatial(mncc{ii,1});
        Text(xy(1,:)+[4,0],['C' num2str(mncc{ii,2})],'FontSize',9);
        Plot(xy,'Color',[0 1 0],'Marker','.','MarkerSize',4,'MarkerEdgeColor','k');
    end
end

end