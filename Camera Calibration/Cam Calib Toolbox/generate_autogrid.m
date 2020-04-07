%标定板相片画圈
a=uint8(zeros(500));
b=uint8(ones(500)*255);
temp=[a b; b a];
I=repmat(temp,6,6);

[x,y]=ndgrid(1:1000,1:1000);

c=[500.5; 500.5];
r=sqrt((x-c(1)).^2+(y-c(2)).^2);
mark=false(6000,6000);
tempmark=r<250&r>150;
mark(1:1000,1:1000)=tempmark;
mark(1001:2000,1:1000)=tempmark;
mark(5001:6000,1:1000)=tempmark;
mark(5001:6000,5001:6000)=tempmark;
mark(1:1000,5001:6000)=tempmark;
I(mark)=127;

figure; imshow(I)
%imwrite(I,'grid.jpg','jpg');
