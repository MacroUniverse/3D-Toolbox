%通过相片上的四个点,确定标定板边缘点在相片上的投影
%cam只需用到xi
function mn=affine_C(mn4,cam)

%生成一圈格点PC
[X,Y,Z]=board;
P=[X(:) Y(:) Z(:)];
ind=matC(size(X));
PC=P(ind,:);

%生成四个格点P4
[Nx,Ny]=size(X);
mark=[1, Nx, Nx+Ny-1, Nx*2+Ny-2 ];%四个角在PC中的ind
P4=PC(mark,:);

%根据四个角的Pmn计算相机的位置
cam=Pmn42cam([P4 mn4],cam);
%根据相机的位置把一圈点投影到相片上
mn=Ploc2mn(PC,cam);

end