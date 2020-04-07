%先把Pmntri关于mn延逆时针方向排序(约定)(否则解会在三角形的另一侧)
%再做成pmd0数组
%使用新的mn坐标

function pmd0=Pmntri2pmd0(Pmntri,cam)

mn1=Pmntri(1,[4 5]); mn2=Pmntri(2,[4 5]); mn3=Pmntri(3,[4 5]);
if cross([mn2-mn1 0],[mn3-mn2 0])<0;%顺时针排列
    temp=Pmntri(1,:);%调换点1和点2
    Pmntri(1,:)=Pmntri(2,:);
    Pmntri(2,:)=temp;
end

xi=cam(6,3);
v1=[Pmntri(1,[4 5]),xi] ;
v2=[Pmntri(2,[4 5]),xi] ;
v3=[Pmntri(3,[4 5]),xi] ;
ang12=vang(v1,v2);
ang23=vang(v2,v3);
ang31=vang(v3,v1);
pmd0=[Pmntri(:,1:3); ang12, ang23, ang31];

end