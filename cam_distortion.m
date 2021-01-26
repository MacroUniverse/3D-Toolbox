% camera distortion generator

% radial distortion
% 1/gamma*atan(gamma*R1)

function [X, Y] = cam_distortion(X, Y, gamma)
if 1 % turn on visualization
    N = 500;
    Nl = 20;
    [X1, Y1] = ndgrid(linspace(-1, 1, Nl), linspace(-1, 1, N));
    [X2, Y2] = ndgrid(linspace(-1, 1, N), linspace(-1, 1, Nl));

    R1 = sqrt(X1.^2 + Y1.^2);
    R2 = sqrt(X2.^2 + Y2.^2);

    C1 = 1/gamma*atan(gamma*R1)./R1; X1 = X1.*C1; Y1 = Y1.*C1;
    C2 = 1/gamma*atan(gamma*R2)./R2; X2 = X2.*C2; Y2 = Y2.*C2;

    figure; scatter(X1(:), Y1(:), 'b.'); hold on;
    scatter(X2(:), Y2(:), 'b.');
end

R = sqrt(X.^2 + Y.^2);
C = 1/gamma*atan(gamma*R)./R; X = X.*C; Y = Y.*C;
end