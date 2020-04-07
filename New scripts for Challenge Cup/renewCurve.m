%通过Lcurve来生成Curve的一个东西

function renewCurve
load Lerr2  Lcurve Curve
for ii=1:size(Lcurve,1)
    temp=numel(Lcurve{ii});
    if temp==0, continue; end
    if temp<2
        warning(['第' num2str(ii) '条曲线只有一个数据, 需要两个']);
    elseif temp>2
        error('有三组数据,暂时没有选择算法或者最优算法');
    else
        Curve{ii}=Ls22curve(Lcurve{ii}{1},Lcurve{ii}{2});
    end
end
save Lerr2 Curve -append
end