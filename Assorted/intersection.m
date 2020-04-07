%求区间的交集
%size(int1)=[N1,2]; size(int2)=[N2,2];
%int中的区间不可重叠
%可输入空集
%若输出是空集, 输出[nan nan]

function inter=intersection(int1,int2)

if isempty(int1) || isempty(int2)
    inter=[]; return;
end
inter=[ ];
%若int1或int2是nan
if any(any(isnan(int1))) || any(any(isnan(int2)))
    inter=[nan nan];
    return;
end

N1=size(int1,1); N2=size(int2,1);

%单区间的情况
if N1==1 && N2==1
    if int1(1)>int1(2) || int2(1)>int2(2)
        error('int1(1)>int1(2) || int2(1)>int2(2)');
    elseif int1(1)>=int2(2) || int1(2)<=int2(1)
        inter=[nan nan];
    else
        inter=[max(int1(1),int2(1)), min(int1(2),int2(2))]; 
    end
    return
end


%多区间的情况

%保证每个区间左端小于右端
for ii=1:N1
    if int1(ii,1)>int1(ii,2)
        error(['int1(' num2str(ii) ',1)>int1(' num2str(ii) ',2)']);
    end
end
for ii=1:N2
    if int2(ii,1)>int2(ii,2)
        error(['int2(' num2str(ii) ',1)>int2(' num2str(ii) ',2)']);
    end
end

%区间按照从小到大排列
[~,ord]=sort(int1(:,1));
int1=int1(ord,:);
[~,ord]=sort(int2(:,1));
int2=int2(ord,:);

%保证区间不重叠
for ii=2:N1
    if int1(ii,1)<int1(ii-1,2)
        error(['int1(' num2str(ii) ',1)<int1(' num2str(ii) ',2)']);
    end
end
for ii=2:N2
    if int2(ii,1)<int2(ii-1,2)
        error(['int2(' num2str(ii) ',1)<int2(' num2str(ii) ',2)']);
    end
end

%计算交集
ii=1; jj=1;
while 1
    
    if ii>N1 || jj>N2
        break
    end
    
    if int1(ii,2)<int2(jj,1)
        ii=ii+1;
    elseif int1(ii,1)>int2(jj,2)
        jj=jj+1;
    else
        temp=[max(int1(ii,1),int2(jj,1)), min(int1(ii,2),int2(jj,2))];
        inter=[inter; temp];
        
        if int1(ii,2)<int2(jj,2)
            ii=ii+1;
        elseif int1(ii,2)>int2(jj,2)
            jj=jj+1;
        else %等于
            ii=ii+1; jj=jj+1;
        end
    end
end


end
