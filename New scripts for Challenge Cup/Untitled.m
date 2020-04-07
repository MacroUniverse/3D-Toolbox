function [matched_points1,matched_points2]=rectify(I1,I2,matched_points1,matched_points2)

   % Compute the fundamental matrix from the corresponding points.
   f = estimateFundamentalMatrix(matched_points1, matched_points2,...
     'Method', 'Norm8Point');

   % Compute the rectification transformations.
   [t1, t2] = estimateUncalibratedRectification(f, matched_points1, ...
                matched_points2, size(I2));
   offset = [120 30]; % shift the coordinate system origin by an offset


   % Transform the points to visualize them together with the rectified images
   pts1Rect = tformfwd(matched_points1, maketform('projective', t1));
   pts2Rect = tformfwd(matched_points2, maketform('projective', t2));

   % Compensate for the shift in the coordinate system origin.
   pts1Rect = bsxfun(@plus, pts1Rect, offset);
   pts2Rect = bsxfun(@plus, pts2Rect, offset);
end

   