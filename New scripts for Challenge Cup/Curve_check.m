%Curve_check

load Lerr2 Curve
N=numel(Curve);
setfigure 3D
plotboard;
for ii=1:N
    if isempty(Curve{ii}), continue; end
    Plot3(Curve{ii},'Color','r','LineWidth',2);
end

