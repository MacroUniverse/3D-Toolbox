%flag=[ ]时标定板的全部world坐标
%生成的x,y坐标可用于plotnet
%flag=任意值时
%参数在里面修改

function [x,y,z]=board

load board.mat
[x,y]=ndgrid(0:Nx,0:Ny);
x=x*dx;%单位厘米
y=y*dy;
z=zeros(size(x));

end