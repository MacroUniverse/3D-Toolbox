%从文件名中提取最后一个整数
%size(name)=[1,N]
%class(name)='char'

function num=name2num(name)
begin=0; over=0;
for ii=numel(name):-1:1
    if name(ii)>='0' && name(ii)<='9'%当前位是数字
        if over==0 
            over=ii;
        else
            continue
        end
    elseif over~=0  
        begin=ii+1;
    end
    
    if begin~=0
        break
    end
end

if  begin==0, begin=1; end

num=str2double(name(begin:over));

end