function [T1,T2] = Otsu_2D( I1,I2 )
[w,h]=size(I1);
hist=zeros(256);
sum=0;
for i=1:w
    for j=1:h
        if I1(i,j)~=0&&I2(i,j)~=0
            hist(I1(i,j)+1,I2(i,j)+1)=hist(I1(i,j)+1,I2(i,j)+1)+1;
            sum=sum+1;
        end
    end
end
if sum==0
    test=9;
end
hist=hist/sum;
P=zeros(256);
X=P;
Y=P;
for i=1:256
    for j=1:256
        if i==1&&j==1
            P(i,j)=hist(i,j);
            X(i,j)=0;
            Y(i,j)=0;
        elseif i==1
            P(i,j)=P(i,j-1)+hist(i,j);
            X(i,j)=0;
            Y(i,j)=Y(i,j-1)+(j-1)*hist(i,j);
        elseif j==1
            P(i,j)=P(i-1,j)+hist(i,j);
            X(i,j)=X(i-1,j)+(i-1)*hist(i,j);
            Y(i,j)=0;
        else
            P(i,j)=P(i,j-1)+P(i-1,j)-P(i-1,j-1)+hist(i,j);
            X(i,j)=X(i,j-1)+X(i-1,j)-X(i-1,j-1)+(i-1)*hist(i,j);
            Y(i,j)=Y(i,j-1)+Y(i-1,j)-Y(i-1,j-1)+(j-1)*hist(i,j);
        end
    end
end
S1=0;
for i=1:256
    for j=1:256
        W0=P(i,j);
        W1=1-P(i,256)-P(256,j)+P(i,j);
        if W0~=0&&W1~=0
            X0=X(i,j);
            Y0=Y(i,j);
            X1=X(256,256)-X(i,256)-X(256,j)+X(i,j);
            Y1=Y(256,256)-Y(i,256)-Y(256,j)+Y(i,j);
            S2=W0*((X0/W0-X(256,256))^2+(Y0/W0-Y(256,256))^2)+W1*((X1/W1-X(256,256))^2+(Y1/W1-Y(256,256))^2);
            if S2>S1
                S1=S2;
                T1=i-1;
                T2=j-1;
            end
        end
    end
end