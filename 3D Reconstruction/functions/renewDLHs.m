%根据最新的Lerr2更新DL数据和Hs数据
%使用该函数前先更新数据库

function renewDLHs

load Lerr2 Lerr2 DL Hs

for ii=1:size(Lerr2,1)
    if size(Lerr2{ii},1)>1
        [DL(ii,:),Hs{ii}]=Ln2P(Lerr2{ii});
    end
end

save Lerr2 DL Hs -append

end