%已知两张图片上的同一群点的坐标mn1和mn2.以及图像的大小size
%选定一个垂直基线(两台相机原点的连线)的方向,把两台相机对准该方向
%再把世界坐标系中的点重新投影到两台相机的底片上.


function [mnRect1,mnRect2]=rectify(mn1,mn2,size)
mn1=mn2spatial2(mn1);
mn2=mn2spatial2(mn2);
   % Compute the fundamental matrix from the corresponding points.
   f = estimateFundamentalMatrix(mn1, mn2,...
     'Method', 'Norm8Point');

   % Compute the rectification transformations.
   [t1, t2] = estimateUncalibratedRectification(f, mn1, ...
                mn2, size);

   % Transform the points to visualize them together with the rectified images
   mnRect1 = tformfwd(mn1, maketform('projective', t1));
   mnRect2 = tformfwd(mn2, maketform('projective', t2));
   mnRect1=spatial2mn2(mnRect1);
   mnRect2=spatial2mn2(mnRect2);
   
   modi=0.95;
   mnRect1(:,1)=(mnRect1(:,1)-8.15548)*modi;
   mnRect2(:,1)=(mnRect2(:,1)-87.7669)*modi;
   
end

   