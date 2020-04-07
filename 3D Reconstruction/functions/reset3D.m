% 初始化Lerr2.mat 和 begin_cams.mat
function reset3D

Lerr2=cell(100,1);
DL=nan(100,3);
Hs=cell(100,1);
Curve=cell(100,1);
Lcurve=cell(100,1);
save Lerr2 Lerr2 DL Hs Lcurve Curve

cams=cell(100,1);
mni=cell(100,1);
mnc=cell(100,1);
Perrs=nan(100,1);
angerrs=nan(100,1);
NthD=1;
NthC=1;
save begin_cams cams mni Perrs angerrs NthD mnc NthC

end