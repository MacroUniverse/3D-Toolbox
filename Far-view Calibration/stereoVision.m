%I1=imread('page1.jpg'); I2=imread('page2.jpg');
I1=imresize(I1,0.2); I2=imresize(I2,0.2);

%转换为灰度图
Igray1=rgb2gray(I1); Igray2=rgb2gray(I2);
%角点检测
cornerDetector = vision.CornerDetector('MaximumCornerCount',500, 'NeighborhoodSize', [5,5]);   
%所有设置参数
%  'Method', 'Harris corner detection (Harris & Stephens)'
% 'Sensitivity', 0.04
% 'SmoothingFilterCoefficients', [1x5 double]
% 'CornerLocationOutputPort', true
% 'MetricMatrixOutputPort', false
% 'MaximumCornerCount', 200
% 'CornerThreshold', 0.0005
% 'NeighborhoodSize', [11 11]

points1=step(cornerDetector,Igray1);
points2=step(cornerDetector,Igray2);
%提取特征
[features1, valid_points1] = extractFeatures(Igray1, points1);
[features2, valid_points2] = extractFeatures(Igray2, points2);
%匹配特征
index_pairs = matchFeatures(features1, features2);
matched_points1 = double(valid_points1(index_pairs(:, 1), :));
matched_points2 = double(valid_points2(index_pairs(:, 2), :));


%简单的筛选方法
s=matched_points2-matched_points1;
s_mean=mean(s,1);
Err=sqrt((s(:,1)-s_mean(:,1)).^2+(s(:,2)-s_mean(:,2)).^2);
mark=Err<0.5*mean(Err);
matched_points1=matched_points1(mark,:);
matched_points2=matched_points2(mark,:);

%显示结果

figure(1); imshow(Igray1); hold on; Scatter(matched_points1); hold off;
figure(2); imshow(Igray2); hold on; Scatter(matched_points2); hold off;


%生成箭头的一段小程序
cam(6,1)=1280; cam(6,2)=720;
mn1=spatial2mn2(matched_points1,cam);
mn2=spatial2mn2(matched_points2,cam);
figure; Scatter(mn1)
view(0,-90);
hold on; Scatter(mn2,'r');
quiver(mn1(:,1),mn1(:,2),(mn2(:,1)-mn1(:,1))*4,(mn2(:,2)-mn1(:,2))*4);

