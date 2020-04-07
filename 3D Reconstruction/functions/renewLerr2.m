%计算mnii中未知和的特征点结合cams,及误差, 更新Lerr2,重复时覆盖
%N是要处理的新相片序号向量

function renewLerr2(N)
load begin_cams mni cams Perrs angerrs
load Lerr2 DL Lerr2

for ii=N%ii是当前相片序号
    mnii=mni{ii};%mmii是当前特征点
    Np=size(mnii,1); 
    for jj=1:Np
        Dname=mnii(jj,3);
        if isnan(DL(Dname))%判断未知点
            L=mn2Lloc(mnii(jj,[1 2]),cams{ii});
            temp=Lerr2{Dname}; 
            if ~isempty(temp) && any(temp(:,9)==ii) %重复覆盖
                temp(temp(:,9)==ii,:)=[];
            end
            Lerr2{Dname}=[temp;  L, Perrs(ii), angerrs(ii), ii];
        end
    end
end

save Lerr2 Lerr2 -append
end