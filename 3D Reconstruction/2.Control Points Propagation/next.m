%begin程序的下一步: 根据已知点确定相机位置, 计算未知点
%如果有已知坐标的点(如地板砖)则可先在Lerr.mat中的DL修改坐标, 直接跳过begin.
%N是要处理的相片编号(矢量)

%详细步骤:
%
%0.矫正相机(若必要). 用image aquisition toolbox获取矫正,储存为calib.mat中的四维相片数组calib.
%用imsave(calib,[相机名]) 把相片储存在相机标定文件夹中的相应相机矫正文件夹.
%用电脑图片浏览器剔除模糊的相片, 然后修改相片序号. 把current folder调到只装有calib相片的文件夹
%运行calib的GUI, 分别操作Image Names, Read Image, Extract grid corners, calibration, Recomp Corners,
%calibration, analysis error, Save.(无需修改fc和cc, 程序直接从Calib_Results.mat中读取数据)

%1.采集相片. 用acquisition toolbox及矫正好的H50获取相片,用imsave脚本命名为next1,next2....,存入桌面
%用电脑图片浏览器剔除模糊的相片,然后修改序号 (若不是第一次,后面的序号接着已有的序号继续)

%2.矫正相片.把current folder调到桌面, 打开calib的GUI,分别操作
%  Image Names, Read Image, Load, Undistort Image菜单, 生成新的相片 next_rect1,next_rect2...
%并存入数据库中该模型的next文件夹中.删除桌面照片

%3.current folder改为上述文件夹, 手动取特征点.用featurepoints(n1:n2)函数取图片的特征点

%4.运行该程序

%5.如要继续补充相片, 可从步骤1开始重做, 运行程序时按照提示进行

function next(N)

load begin_cams cams Perrs angerrs mni
load Lerr2 DL

%给每张图片的相机定位, 计算cam和误差
for ii=N
    %显示图片和特征点,区分已知坐标的特征点
    [h,mark]=photofeature('next_rect',ii);
    
    %判断这张图的定位是否成熟
    con=input('是否操作这张图? (是:[ ] 否:任意键)');
    if ~isempty(con)
        close(h); continue%调到下一张图
    end
    setfigure 3D%画图
    scatter3(DL(:,1),DL(:,2),DL(:,3), 5, 'filled');    
    
    %利用所有的已知点进行定位
    mnii=mni{ii}(mark,:);
    
    [mn4,Dname]=mnpick4(mnii);%用四点进行pmd定位
    cam=setcam('H50');
    cam=Pmn42cam([DL(Dname,:),mn4],cam);
    
    Pmn=[DL(mnii(:,3),:),mnii(:,1:2)];%用所有点进行mnS2定位
    [cams{ii},Perrs(ii),angerrs(ii)]=cam_modi(Pmn,cam);
    showcam(cam,3);
 
    close(h);%关闭图片窗


    save begin_cams cams Perrs angerrs -append
end
    save begin_cams cams Perrs angerrs -append

renewLerr2(N);%根据cams, mni, Perr2, angerr2. 更新出Lerr2
renewDLHs;%根据Lerr2, 更新出DL, Hs

end