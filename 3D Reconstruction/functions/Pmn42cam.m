%根据四行Pmn找到一个cam
%cam只需用到cam(6,3);

function cam=Pmn42cam(Pmn4,cam)

pmd0=Pmntri2pmd0(Pmn4([1 2 3],:),cam);
P1=numpmd(pmd0); N1=size(P1,1);
pmd0=Pmntri2pmd0(Pmn4([3 4 1],:),cam);
P2=numpmd(pmd0); N2=size(P2,1);

min=inf;
for ii=1:N1
    for jj=1:N2
        mag=vmag(P1(ii,:)-P2(jj,:));
        if mag<min
            min=mag;
            ind1=ii; ind2=jj;
        end
    end
end

cam(4,:)=mean([P1(ind1,:); P2(ind2,:)]);
cam=ori(Pmn4([1 3],:),cam);

end

