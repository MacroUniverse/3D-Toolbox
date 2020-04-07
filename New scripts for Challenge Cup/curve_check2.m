function curve_check2
load Lerr2 Curve;    
figure; axis equal; hold on;
for ii=1:100
    if ~isempty(Curve{ii})
        Plot3(Curve{ii});
    end
end
end