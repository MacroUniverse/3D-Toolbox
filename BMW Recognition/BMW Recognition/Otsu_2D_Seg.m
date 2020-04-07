function OutImage=Otsu_2D_Seg(I)
[T1,T2]=Otsu_2D(I,I);
if(T1>T2)
    tmp=T1;
    T1=T2;
    T2=tmp;
end
OutImage=(I>=T1)&(I<=T2);