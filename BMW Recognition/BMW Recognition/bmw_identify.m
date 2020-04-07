function showimg=bmw_identify(chessboard)
[width,height,n]=size(chessboard);
if n==3
    showimg=chessboard;
    chessboard=rgb2gray(chessboard);
else
    showimg(:,:,1)=chessboard;
    showimg(:,:,2)=chessboard;
    showimg(:,:,3)=chessboard;
end
chessboard=double(chessboard);
J=fix(conv2(chessboard,[1,1,1;1,1,1;1,1,1])/9);
chessboard=J(2:width+1,2:height+1);
figure,imshow(uint8(chessboard));
rst1=seg(chessboard,60);
rst2=seg(chessboard,70);
rst=rst1|rst2;
figure,imshow(rst);
se1 = strel('square',3);
rst_PZ=imdilate(rst,se1);
figure,imshow(rst_PZ)
se2 = strel('square',7);
rst_FS=imerode(rst_PZ,se2);
figure,imshow(rst_FS)
label=bwlabel(rst_FS,8);
max_label=max(max(label));
hold on;
for i=1:max_label
    [row,col]=find(label==i);
    if(length(row)>100&length(row)<2000)
        [var,r,x,y]=round_detect(row,col);
        if(var<15&&r>15&&r<40)
            x_min=round(x-r-var);
            x_max=round(x+r+var);
            y_min=round(y-r-var);
            y_max=round(y+r+var);
            showimg(x_min:x_max,y_min-1:y_min+1,1)=255;
            showimg(x_min:x_max,y_min-1:y_min+1,2)=0;
            showimg(x_min:x_max,y_min-1:y_min+1,3)=0;
            showimg(x_min:x_max,y_max-1:y_max+1,1)=255;
            showimg(x_min:x_max,y_max-1:y_max+1,2)=0;
            showimg(x_min:x_max,y_max-1:y_max+1,3)=0;
            showimg(x_min-1:x_min+1,y_min:y_max,1)=255;
            showimg(x_min-1:x_min+1,y_min:y_max,2)=0;
            showimg(x_min-1:x_min+1,y_min:y_max,3)=0;
            showimg(x_max-1:x_max+1,y_min:y_max,1)=255;
            showimg(x_max-1:x_max+1,y_min:y_max,2)=0;
            showimg(x_max-1:x_max+1,y_min:y_max,3)=0;
        end
    end
end
figure,imshow(showimg)