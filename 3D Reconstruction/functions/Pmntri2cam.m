%根据Pmntri数组(三维可)求出cam, 画出每个三棱锥的解, 并画出排除无关解的情况
%调用ntpmd函数确定Pcam
%调用ori函数确定cam33
%输入的cam只用到xi
%size(Pmntri)=[3,5,Ntri];

%mn按照y轴倒置的格式

function [cam,perr, angerr]=Pmntri2cam(Pmntri,cam)

Ntri=size(Pmntri,3);

Pcam=[];

for n=1:Ntri

    %求pmd0
    
    pmd0=Pmntri2pmd0(Pmntri(:,:,n),cam);
    
    %求解Pcam
    
    %牛顿pmd法先不用,暂时用全能的sympmd代替
    %guess=[0, 0, 4*vmag(pmd0(1,:)-pmd0(2,:))];
    %Pcam(n,:)=ntpmd(pmd0,guess);
    
    P=numpmd(pmd0);%数值解pmd
    scatter3(P(:,1),P(:,2),P(:,3),3,'filled');%描点确认(每一组解颜色一样)
    Pcam=[Pcam;P];
    
end


[Pcam,perr]=pickP(Pcam);  %排除无关点, 再取平均值
scatter3(Pcam(1),Pcam(2),Pcam(3),3,'filled');%描点确认

cam(4,:)=Pcam;
cam(5,:)=vloc2vcam(-Pcam,cam);

cam=ori(Pmntri([1 3],:,1),cam);%镜头对准cam33

angerr=perr/vmag(Pcam-Pmntri(1,1:3,1));

disp('Pcam平均误差');
disp(perr);

end