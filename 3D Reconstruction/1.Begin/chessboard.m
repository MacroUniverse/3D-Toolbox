%1,0,格子数组
%生成1,0相间的数组,其中mat(1,1)=0;
function mat=chessboard(N1,N2)

temp=(1:N1)';
col=logical(mod(temp,2));
col2=[~col col];
mat=repmat(col2,1,ceil(N2/2));
mat=mat(:,1:N2);

end