%通过mnc和对应的cams来生成每条曲线的所有射线束
%Lcurve=cell(N,1);
%Lcurve{ii}=cell(M,1);M是第ii根曲线对应的相片的数目

function renewLcurve

load begin_cams mnc cams
load Lerr2 Lcurve

for ii=1:size(mnc,1)%每个循环处理一张相片
    if isempty(mnc{ii}),continue; end
    cam=cams{ii};
    for jj=1:size(mnc{ii},1)
        mn=mnc{ii}{jj,1}; ind=mnc{ii}{jj,2};
        temp=mn2Lloc(mn,cam);
        Lcurve{ind}=[Lcurve{ind}; {temp}];
    end
end
save Lerr2 Lcurve -append

end