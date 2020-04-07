%设置当前文件夹
function cf(flag)
if nargin==0
    d='C:\Users\addis\desktop';%默认桌面
elseif strcmp(flag,'3d') || strcmp(flag,'3D')
    d='D:\3D tool box';
end
cd(d);
end