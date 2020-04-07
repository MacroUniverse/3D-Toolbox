%在修改过后的calibration 工具包运行后, 处理格点数据并且保存
%处理完成后,x,y矩阵是spatial相片坐标系里的坐标
%支持批量处理, prefix_name是相片的前缀名
%相片名称格式:[prefix_name num2str(ii) '_corners.mat']
%n有两种格式,如果n是一个整数,则相片序号从1到n,如果n是序号的行向量,则分别处理第n(i)张


function corner_data_process(prefix_name,n)

if numel(n)==1
n=1:n;
end

for ii=n

clear x y xcorners ycorners x0 y0
load([prefix_name num2str(ii) '_corners.mat']);
if ~exist('xcorners')
    warning([prefix_name num2str(ii) '_corners.mat has already been processed']);
    continue
end
x0=fliplr(xcorners);
y0=fliplr(ycorners);
x=zeros(11,11); y=x;
x(:)=x0;
y(:)=y0;
x=flipud(x); y=flipud(y);
save([prefix_name num2str(ii) '_corners.mat'],'x', 'y')

end

end