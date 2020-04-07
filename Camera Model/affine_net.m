%通过相片上的四个点,确定标定板网格在相片上的投影
%cam只需用到xi
function [m,n]=affine_net(mn4,cam)

[X,Y,Z]=board;
P=[X(:) Y(:) Z(:)];
[Nx Ny]=size(X);
mark=[1 Nx Nx*Ny Nx*Ny-Ny+1 ];
P4=P(mark,:);
cam=Pmn42cam([P4 mn4],cam);
mn=Ploc2mn(P,cam);
m=zeros(Nx,Ny); n=m;
m(:)=mn(:,1); n(:)=mn(:,2);

end