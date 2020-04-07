function [rst_var,rst_mean,rst_center_x,rst_center_y]=round_detect(row,col)
x0=mean(row);
y0=mean(col);
len=sqrt((row-x0).^2+(col-y0).^2);
rst_var=var(len);
rst_mean=mean(len);
rst_center_x=x0;
rst_center_y=y0;