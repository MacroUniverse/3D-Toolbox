function int=int_repeat(int)

N=size(int,1);
%截断误差
err=1e-10;


for ii=1:N
    temp=int(ii,:);
    for jj=ii+1:N
        if abs(temp(1)-int(jj,1))<err && abs(temp(2)-int(jj,2))<err
            int(jj,:)=[nan nan];
        end
    end
end

end