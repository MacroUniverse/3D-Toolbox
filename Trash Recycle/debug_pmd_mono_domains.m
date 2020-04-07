%pmd_mono_domains 的每个区间画图调试

%找区间
[int,N]=pmd_mono_domains(pmd0);

%画图

Ny=3000;%每个domian的描点数-1
for ii=1:numel(N)
    y=zeros(Ny+1,1); L1=y;
    path=Path(N(ii));
    for jj=0:Ny
        L1(jj+1)=int(ii,1)*(Ny-jj)/Ny+int(ii,2)*jj/Ny;
        y(jj+1)=pmdtrial(pmd0,L1(jj+1),path);
    end
    figure; plot(L1,y); title(['domain' num2str(N(ii))]); grid on
end