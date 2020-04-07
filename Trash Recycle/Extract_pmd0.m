%解压pmd0
%使用前准备好pmd0和顶点P

P1=pmd0(1,:); P2=pmd0(2,:); P3=pmd0(3,:);
L1=vmag(P1-P); L2=vmag(P2-P); L3=vmag(P3-P);
L12=vmag(P2-P1); L23=vmag(P3-P2); L31=vmag(P1-P3);
ang12=vang(P1-P,P2-P); ang23=vang(P2-P,P3-P); ang31=vang(P3-P,P1-P);
Ls12=L12/sin(ang12); Lt12=L12/tan(ang12);
Ls23=L23/sin(ang23); Lt23=L23/tan(ang23);
Ls31=L31/sin(ang31); Lt31=L31/tan(ang31);
pmd0(4,:)=[ang12 ang23 ang31];
