%从begin_rect_corners中提取全部数据, 存入Lerr2和begin_cams

load Lerr2 DL
[X,Y,Z]=board;
N=numel(X);
DL(1:N,:)=[X(:),Y(:),Z(:)];
save Lerr2 DL -append

load begin_rect1_corners
load begin_cams mni
[m,n]=spatial2mn(x,y);
mni{1}=[m(:) n(:) (1:121)'];
save begin_cams mni -append
