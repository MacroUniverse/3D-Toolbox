%矩阵轮廓下标(从[1,1]开始逆时针排序)

function [ind,sub]=matC(size)

nr=size(1); nc=size(2);
n1=1; n2=nr; n3=nr+nc-1; n4=2*nr+nc-2; n5=2*nr+2*nc-3;

sub(n1:n2-1,1)=1:nr-1;
sub(n1:n2-1,2)=1;

sub(n2:n3-1,1)=nr;
sub(n2:n3-1,2)=1:nc-1;

sub(n3:n4-1,1)=nr:-1:2;
sub(n3:n4-1,2)=nc;

sub(n4:n5-1,1)=1;
sub(n4:n5-1,2)=nc:-1:2;

ind=sub2ind(size,sub(:,1),sub(:,2));

end