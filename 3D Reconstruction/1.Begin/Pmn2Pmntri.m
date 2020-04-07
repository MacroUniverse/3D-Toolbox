%根据Pmn数组和指定的顺序Order生成Pmntri三维数组
%size(Order)=[N,3];N是三棱锥的个数

function Pmntri=Pmn2Pmntri(Pmn,Order)
    Ntri=size(Order,1);
    Pmntri=zeros(3,5,Ntri);
    for n=1:Ntri
        Pmntri(:,:,n)=Pmn(Order(n,:),:);
    end
end