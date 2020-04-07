function rst=seg(image,T)
[width,height]=size(image);
rst=zeros(width,height);
for i=1:T:width
    for j=1:T:height
        if(i+T<=width&&j+T<=height)
            sed_image=image(i:i+T,j:j+T);
            bw_sed_image=Otsu_2D_Seg(sed_image);
            rst(i:i+T,j:j+T)=rst(i:i+T,j:j+T)|bw_sed_image;
        else if(i+T>width&&j+T<=height)
                sed_image=image(i:width,j:j+T);
                bw_sed_image=Otsu_2D_Seg(sed_image);
                rst(i:width,j:j+T)=rst(i:width,j:j+T)|bw_sed_image;
            else if(i+T<=width&&j+T>height)
                    sed_image=image(i:i+T,j:height);
                    bw_sed_image=Otsu_2D_Seg(sed_image);
                    rst(i:i+T,j:height)=rst(i:i+T,j:height)|bw_sed_image;
                else
                    sed_image=image(i:width,j:height);
                    bw_sed_image=Otsu_2D_Seg(sed_image);
                    rst(i:width,j:height)=rst(i:width,j:height)|bw_sed_image;
                end
            end
        end
    end
end
figure,imshow(rst)