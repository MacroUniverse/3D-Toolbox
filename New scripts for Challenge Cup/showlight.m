function showlight(h,radium)
   if nargin==0
       h=light;
       radium=0.1;
   elseif nargin==1
       radium=0.1;
   end
   Position=get(h,'Position');
   [Sx,Sy,Sz]=sphere(10);
   Sx=Sx*radium+Position(1); Sy=Sy*radium+Position(2); Sz=Sz*radium+Position(3);
   surf(Sx,Sy,Sz);
end