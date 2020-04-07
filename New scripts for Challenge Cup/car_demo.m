%challenger demo car
%挑战杯的四驱车重建演示
%可以同时存在多个数据文件夹
%(注意不要对其他文件夹进行操作)
cd('D:\时宏宇\matlab 个人文件夹\3D tool box\三维重建\数据库\car');
photofeature('next_rect',[2 7 8 15]);
Curve_check;
load tempdata cam; cam2axes(cam);
set(gca,'CameraTargetMode','auto');