%获得当前演示的相片对象的大小
function Size=photoSize
    H=get(gca,'children');
    for ii=1:numel(H)
        if strcmp(get(H(ii),'type'), 'image')
            h=H(ii); break;
        end
    end
    Size=[465 767];%size(get(h,'CData'));
end