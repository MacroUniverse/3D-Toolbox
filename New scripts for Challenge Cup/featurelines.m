%目前先不整合到mat文件里面去, 直接输出结果

function featurelines(prename,N)

load begin_cams mnc NthC

%显示相片
photofeature(prename,N);

while 1%每个循环确定一个控制点在不同图片中的坐标
    
    flag=input('新线:[ ]; 旧线:[序号]; 删除:[''序号'']; 结束:0');
    if flag==0
        break
    elseif isempty(flag)%新线
        disp(['现在取第' num2str(NthC) '条曲线']);
        curve=one_curve;
        temp=get(gcf,'Name'); 
        Nthphoto=name2num(temp);%获取相片序号
        mnc{Nthphoto}=[mnc{Nthphoto}; {curve} {NthC}]; 
        NthC=NthC+1; %下一个特征曲线;
    elseif isa(flag,'char') %删除曲线
        temp=get(gcf,'Name'); 
        Nthphoto=name2num(temp);%获取相片序号
        Nthcurve=str2double(flag);%获取线的序号
        ind=findmnc(Nthphoto,Nthcurve,mnc);
        mnc{Nthphoto}(ind,:)=[]; 
    elseif flag~=0%旧线
        disp(['现在取第' num2str(flag) '条曲线']);
        input('请选中要操作的图片(ok:[])');
        temp=get(gcf,'Name'); 
        Nthphoto=name2num(temp);%获取相片序号
        
        %%%%%%%%%%%这一段程序实现重叠覆盖
        if isempty(mnc{Nthphoto})
            temp=0;
        else
            temp=[mnc{Nthphoto}{:,2}]==flag;
        end
        if any(temp)%如果该照片已有该序号的曲线,覆盖
             con=input('该图中该曲线已存在,是否覆盖?(ok:[] no:any) ');
             if isempty(con)%确认覆盖
                 mnc{Nthphoto}{temp,1}=one_curve;
             else
                 continue;
             end
        else
            curve=one_curve;
            mnc{Nthphoto}=[mnc{Nthphoto}; {curve} {flag}];
        end
        %%%%%%%%%%%%%%
       
    end
    
    save begin_cams mnc NthC -append%每个循环存档(每条曲线存档) 
end

end

%取一条曲线的程序
%按下左键确定一点
%按下右键调整图像或者选择其他功能
function mn=one_curve
input('调整图像缩放,准备取线 (ok:[])');
ii=1;xy=zeros(200,2);
while 1
    [x,y,button]=ginput(1);
    if button==1%左键
        xy(ii,:)=[x y]; ii=ii+1;
        h=scatter(x,y,'Marker','.','SizeData',30,'CData',[1 0 0]);
    else
        flag=input('继续:[]  撤销:0 完成:1');
        if flag==0
            ii=ii-1;delete(h);
        elseif flag==1
            break;
        end
    end
end
xy(ii:end,:)=[];
mn=spatial2mn(xy);
end




