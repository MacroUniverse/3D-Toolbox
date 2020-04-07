%删除某个特征点或者特征曲线
%numel(NthPhoto)=numel(NthCurve)=1;
%PorC='P'(代表点)或'C'(代表曲线)
%当选'P'时, 输入的是mni, 选'C'时输入的是mnc.

function mnc=delete_feature(NthPhoto,NthFeature,PorC,mnc)
if nargin<4
    if PorC=='P'
        load begein_cams mni
    elseif PorC=='C'
        load begin_cams mnc
    else
        disp('PorC=');disp(PorC);
        error('PorC的值必须是''P''或者''C'' '); 
    end
elseif PorC=='P'
    mni=mnc;clear mnc;
end

if PorC=='P'
    error('程序未完成');
else%PorC=='C'
    mark=mnc{Nthphoto}{:,2}==NthFeature;
    mnc{Nthphoto}(mark,:)=[];
    if nargout>0, return;
    else save begin_cam mnc -append
    end
end

end