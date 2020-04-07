%在格子上画积木的程序
%cube 是DL的引索, 每个元胞含有一列八个引索, 代表一个立方体
function draw_bricks(cube)

load Lerr2 DL
%如果没有输入就用默认
if nargin<1
cube{1}=[15; 16; 17; 18; 19; 20; 21; 30];
cube{2}=[22; 23; 24; 25; 29; 26; 27; 28];
cube{3}=[7; 8; 10; 9; 12; 11; 13; 14];
cube{4}=[31; 32; 33; 34; 35; 36; 37; 38];
end

Ncube=numel(cube);
Cube=cell(Ncube,1);

for ii=1:4
    Cube{ii}=DL(cube{ii},:);
end

%画出每个长方体的轮廓
ind1=[1 4; 2 3; 6 7; 5 8; 1 4];
ind2=[1 2; 5 6]; ind3=[3 4; 7 8];
for ii=1:4
    P=Cube{ii};
    spec={'LineWidth',1,'FaceColor','g','EdgeColor','b'};
    Surf(P,ind1,'CData',ones(5,2)/2,spec{:});
    Surf(P,ind2,'CData',ones(2,2)/2,spec{:});
    Surf(P,ind3,'CData',ones(2,2)/2,spec{:});
end

end