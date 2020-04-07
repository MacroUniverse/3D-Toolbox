%取指定相片的特征点,储存在mni数组
%N是要展示的相片的序号数组

function featurepoints(prename,N)

load begin_cams mni NthD
%mni是N-by-1的元胞, 每个元胞是N-by-3的数组
%每个元胞代表一张相片, 一个元胞前两列是mn坐标, 第三列是点的编号(Dname)

%读取,显示相片
I4=zeros(480,848,1,4);
for ii=N
    photofeature(prename,ii);
    I4(:,:,1,ii)=imread([prename num2str(ii) '.bmp']);
end



while 1%每个循环确定一个控制点在不同图片中的坐标

    flag=input('新点:[ ]; 旧点:1; 结束:0');
    if flag==0
        break
    elseif isempty(flag)
        mni=f1(mni,NthD,I4); 
        NthD=NthD+1; %下一个特征点
    elseif flag==1
        Dname=f2; %补充已有的特征点
        mni=f1(mni,Dname,I4);
    end
    
    save begin_cams mni NthD -append%每个循环存档(每个特征点存档) 
end

end

    
    

%取不同图片上的一个特征点
%重复覆盖
function mni=f1(mni,Dname,I4)
    while 1%每个循环确定一个控制点
        
        temp=input(['取点' num2str(Dname) '   选中图片, 调整缩放 (ok:[ ] corner:任意键)']);
        Name=get(gcf,'Name'); n=name2num(Name);
        p=ginput(1);
        Scatter(p);
        if ~isempty(temp)
            p=board_corner(p,I4(:,:,1,n),7,7);
            Scatter(p,'Marker','+','LineWidth',1.5);
        end
         text(p(1),p(2),num2str(Dname));%标记, 注释
        %若有重复则覆盖
        mnii=mni{n};
        if ~isempty(mnii) && any(mnii(:,3)==Dname)
           mnii(mnii(:,3)==Dname,:)=[];
        end
        mni{n}=[mnii; spatial2mn(p) Dname];

        con=input('继续取该特征点? (是:[ ] 否:任意值)');
        if ~isempty(con)
            break
        end
    end
end


function Dname=f2
    flag=input('输入序号:[序号]; 鼠标取点:[未完成]');
    if isempty(flag)
        %Name=get(gcf,'Name'); n=name2num(Name);
        %mnii=mni{n};
    else
        Dname=flag;
    end
    
end
    