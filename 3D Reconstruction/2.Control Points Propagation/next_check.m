%next函数的画图检查, 不修改数据
%N是要检查的点的序号

function next_check(N)


load Lerr2 Lerr2 DL Hs
load begin_cams cams

%画出所有已知点
setfigure 3D
scatter3(DL(:,1),DL(:,2),DL(:,3),4,'b');

% 画出相机标出序号
for ii=1:numel(cams)
    if isempty(cams{ii})
        continue
    end
    showcam(cams{ii}, 5);
    p=cams{ii}(4,:)-cams{ii}(3,:)*0.2;
    text(p(1),p(2),p(3), num2str(ii));
end


%画出射线
for ii=N
    NL=size(Lerr2{ii},1);
    for jj=1:NL
        mag=vmag(DL(ii,:)-Lerr2{ii}(jj,1:3));
        plotL3(Lerr2{ii}(jj,1:6),mag+0.1);
    end
end

%画出最佳交点, 误差点分布, 显示每条线的误差
for ii=N
    NL=size(Lerr2{ii},1);
    if NL>1
        D=DL(ii,:);%最佳交点
        P=LP2P(Lerr2{ii}(:,1:6), DL(ii,:));%误差点分布
        
        scatter3(P(:,1),P(:,2),P(:,3),30,'filled','b');
        scatter3(D(1),D(2),D(3),40,'r');
        
        disp(['第' num2str(ii) '点的误差分布:']);
        disp(Hs{ii});
    end
end



end