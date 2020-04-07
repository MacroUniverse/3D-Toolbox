%begin系列总程序:从含有棋盘的相片中确定其他点的坐标
%
%
%步骤:
%
%0.矫正相机. 用image aquisition toolbox获取矫正,储存为calib.mat中的四维相片数组calib.
%用imsave(calib,[相机名]) 把相片储存在相机标定文件夹中的相应相机矫正文件夹.
%用电脑图片浏览器剔除模糊的相片, 然后修改相片序号. 把current folder调到只装有calib相片的文件夹
%运行calib的GUI, 分别操作Image Names, Read Image, Extract grid corners, calibration, Recomp Corners,
%calibration, analysis error, Save.需要用到cc的程序会自动在Calib_Results中读取
%
%1.采集相片.用acquisition toolbox及矫正好的H50获取相片,用imsave储存为begin1,begin2....,存入
%"三维重建\1.开始重建\初始相片\aquisition新相片"文件夹. 用电脑图片浏览器剔除模糊的相片,
%然后修改序号 (若不是第一次,后面的序号接着已有的序号继续)
%
%2.矫正相片.把current folder调到上述文件夹, 打开calib的GUI,分别操作
%  Image Names, Read Image, Load, Undistort Image菜单, 生成新的相片 begin_rect1,begin_rect2...
%并存入"三维重建\1.开始重建\初始相片"文件夹
%
%3.获取格点. 删除矫正前的相片,重新启动calib的GUI,取begin_rect系列上的棋盘格点
%  (将会自动生成begin_rect1_corners.mat等格点数据mat文件), 关闭calibGUI,
%  用corner_data_process('begin_rect',n1:n2)函数处理上述mat文件(从序号n1到序号n2)
%  
%4.手动取特征点.用featurepoints(n1:n2)函数取图片的特征点
%
%5.运行本程序

%本程序运行过程中, 如有操作错误, 在任意的input中输入'err'字符串即可
%
%
%%Lerr2是专门用来储存通过各点的射线的元胞数组, 每个序号的点占一个元胞 , 每个元胞是N*9的数组
%N对应直过该点直线的条数, 每行储存一条直线.格式为: 
%[ px,py,pz,ex,ey,ez, perr, angerr, nth];(前六个是6参数射线, perr起点误差, angerr角误差,
%nth来源相片的序号.

function begin(N)%N是所有要处理的相片序号

load begin_cams cams perrs angerrs

%1.根据棋盘点阵数据, 确定相机位置

for ii=N %ii是当前处理的相片序号
%(其间有画图确认,误差报告等程序,保证结果的正确性)
[cams{ii},perrs(ii),angerrs(ii)]=board2cam(ii);
end

save begin_cams cams perrs angerrs -append


%2.根据特征点(featurepoints)以及上面生成的相机位置生成(补充)Lerr2数组
renewLerr2(N);
renewDLHs%计算交点和误差, 更新DL, Hs

end