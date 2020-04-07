%根据cam的数据设置axes property

function cam2axes(cam,ha)

if nargout<2
    ha=gca;
end

set(ha,'CameraPosition',cam(4,:));
set(ha,'CameraTarget',cam(4,:)+cam(3,:));
set(ha,'CameraUpVector',-cam(2,:));


end