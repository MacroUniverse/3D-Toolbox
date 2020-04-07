function setfigure(flag)

figure('color','w');
switch flag
    case 'blank'
        error('用setfigure ai代替');
    case 'ai'
        set(gcf,'unit','pixel','position',[600 100 500 500]);
        set(gca,'unit','normalized','position',[0 0 1 1]);
        axis on; axis([-250,250,-250,250]*3/4); axis equal; %这个尺寸不能随便改, 输出eps以后, 一个单位刚好是1pt
        set(gca,'xtick',[],'ytick',[],'box','on','xlimmode','manual','ylimmode','manual',......
             'xtickmode','manual','xticklabelmode','manual','ytickmode','manual','yticklabelmode','manual',....
             'xticklabel',[],'yticklabel',[]); hold on;%
    case 'photo'
        axis on;
        axis([-1/2 1/2 -3/8 3/8]);
        grid off;
        hold on;
    case '3D'
        axis on;
        axis equal;
        grid on;
        hold on;

        ha=gca;
        set(ha,'CameraViewAngle',10,......
                   'Projection','perspective',......
                   'CameraPosition',[3.575 -6.093 6.604],...
                   'CameraTargetMode','auto')
        cameratoolbar;
    case 'N97'
        axis on;
        axis equal;
        axis([0 2592 0 1944])
        grid on;
        hold on;
        cameratoolbar;
    case 'N973'
        axis on;
        axis([0 2592 0 1944 -40 40]);
        grid on;
        hold on;
        cameratoolbar;
    case 'H50';
        load Calib_Results cc
        axis equal
        axis([-424-(cc(1)-424) 424-(cc(1)-424) -240-(cc(2)-240) 240-(cc(2)-240)]);
        view(0,-90);
        hold on;
        grid on;
        cameratoolbar;
end
end