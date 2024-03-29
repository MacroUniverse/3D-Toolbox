%从相机标定工具箱中的cornerfinder修改的取格点的工具
%确定所需格点附近的一个初值,程序可以精确找到格点的位置

function [xy,good,type] = board_corner(xy0,I,wintx,winty)

%[xy] = cornerfinder(xy0,I);
%
%Finds the sub-pixel corners on the image I with initial guess xy0
%xy0 and xy are 2xN matrices. The first component is the x coordinate
%(horizontal) and the second component is the y coordinate (vertical)
% 
%Based on Harris corner finder method
%
%Finds corners to a precision below .1 pixel!

%Oct. 14th, 1997 - UPDATED to work with vertical and horizontal edges as well!!!
%Sept 1998 - UPDATED to handle diverged points: we keep the original points
%
%good is a binary vector indicating wether a feature point has been properly
%found.
%
%Add a zero zone of size wx2,wy2
%July 15th, 1999 - Bug on the mask building... fixed + change to Gaussian mask with higher
%resolution and larger number of iterations.


% California Institute of Technology
% (c) Jean-Yves Bouguet -- Oct. 14th, 1997



line_feat = 1; % set to 1 to allow for extraction of line features.

xy0 = fliplr(xy0);


if nargin < 4,
   winty = 5;
   if nargin < 3,
      wintx = 5;
   end;
end;


if nargin < 6,
   wx2 = -1;
   wy2 = -1;
end;


%mask = ones(2*wintx+1,2*winty+1);
mask = exp(-((-wintx:wintx)'/(wintx)).^2) * exp(-((-winty:winty)/(winty)).^2);


if (wx2>0) && (wy2>0),
   if ((wintx - wx2)>=2)&&((winty - wy2)>=2),
      mask(wintx+1-wx2:wintx+1+wx2,winty+1-wy2:winty+1+wy2)= zeros(2*wx2+1,2*wy2+1);
   end;
end;

offx = (-wintx:wintx)'*ones(1,2*winty+1);
offy = ones(2*wintx+1,1)*(-winty:winty);

resolution = 0.005;

MaxIter = 10;

[nx,ny] = size(I);
N = size(xy0,1);

xy = xy0; % first guess... they don't move !!!

type = zeros(1,N);


for i=1:N,

    v_extra = resolution + 1; 		% just larger than resolution

    compt = 0; 				% no iteration yet
    
    while (norm(v_extra) > resolution) && (compt<MaxIter),

        cIx = xy(i,1); 			%
        cIy = xy(i,2); 			% Coords. of the point
        crIx = round(cIx); 		% on the initial image
        crIy = round(cIy); 		%
        itIx = cIx - crIx; 		% Coefficients
        itIy = cIy - crIy; 		% to compute
        if itIx > 0, 			% the sub pixel
            vIx = [itIx 1-itIx 0]'; 	% accuracy.
        else
            vIx = [0 1+itIx -itIx]';
        end;
        if itIy > 0,
            vIy = [itIy 1-itIy 0];
        else
            vIy = [0 1+itIy -itIy];
        end;


        % What if the sub image is not in?

        if (crIx-wintx-2 < 1), xmin=1; xmax = 2*wintx+5;
        elseif (crIx+wintx+2 > nx), xmax = nx; xmin = nx-2*wintx-4;
        else
            xmin = crIx-wintx-2; xmax = crIx+wintx+2;
        end;

        if (crIy-winty-2 < 1), ymin=1; ymax = 2*winty+5;
        elseif (crIy+winty+2 > ny), ymax = ny; ymin = ny-2*winty-4;
        else
            ymin = crIy-winty-2; ymax = crIy+winty+2;
        end;


        SI = I(xmin:xmax,ymin:ymax); % The necessary neighborhood
        SI = conv2(conv2(double(SI),double(vIx),'same'),vIy,'same');
        SI = SI(2:2*wintx+4,2:2*winty+4); % The subpixel interpolated neighborhood
        [gy,gx] = gradient(SI); 		% The gradient image
        gx = gx(2:2*wintx+2,2:2*winty+2); % extraction of the useful parts only
        gy = gy(2:2*wintx+2,2:2*winty+2); % of the gradients

        px = cIx + offx;
        py = cIy + offy;

        gxx = gx .* gx .* mask;
        gyy = gy .* gy .* mask;
        gxy = gx .* gy .* mask;


        bb = [sum(sum(gxx .* px + gxy .* py)); sum(sum(gxy .* px + gyy .* py))];

        a = sum(sum(gxx));
        b = sum(sum(gxy));
        c = sum(sum(gyy));

        dt = a*c - b^2;

        xc2 = [c*bb(1)-b*bb(2) a*bb(2)-b*bb(1)]/dt;


        %keyboard;

        if line_feat,

            G = [a b;b c];
            [~,S,V]  = svd(G);

            %keyboard;

            % If non-invertible, then project the point onto the edge orthogonal:

            if (S(1,1)/S(2,2) > 50),
                % projection operation:
                xc2 = xc2 + sum((xy(i,:)-xc2).*(V(:,2)'))*V(:,2)';
                type(i) = 1;
            end;

        end;


        if (isnan(xc2(1)) || isnan(xc2(2))),
            xc2 = [0 0];
        end;
        
        v_extra = xy(i,:) - xc2;

        xy(i,:) = xc2;

        %      keyboard;

        compt = compt + 1;

    end
end;


% check for points that diverge:

delta_x = xy(:,1) - xy0(:,1);
delta_y = xy(:,2) - xy0(:,2);

%keyboard;


bad = (abs(delta_x) > wintx) | (abs(delta_y) > winty);
good = ~bad;
in_bad = find(bad);

% For the diverged points, keep the original guesses:

xy(in_bad,:) = xy0(in_bad,:);

xy = fliplr(xy);

good = good';

end