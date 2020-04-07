% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1037.667530588338200 ; 1038.320144066751000 ];

%-- Principal point:
cc = [ 377.239704549990680 ; 279.454367286923740 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.189971412797640 ; 0.121075938007893 ; 0.000006945522403 ; 0.000620843014638 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.481574523533355 ; 2.400209363190848 ];

%-- Principal point uncertainty:
cc_error = [ 1.786650248174491 ; 2.152516830649624 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.004594390510024 ; 0.022810398262403 ; 0.000398885670920 ; 0.000423454008022 ; 0.000000000000000 ];

%-- Image size:
nx = 848;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 13;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.098245e+00 ; 1.999126e+00 ; -4.195944e-01 ];
Tc_1  = [ -4.489050e+01 ; -9.130957e+01 ; 5.343736e+02 ];
omc_error_1 = [ 1.430570e-03 ; 1.548483e-03 ; 2.926341e-03 ];
Tc_error_1  = [ 9.252469e-01 ; 1.093130e+00 ; 1.275623e+00 ];

%-- Image #2:
omc_2 = [ 2.196774e+00 ; 2.073649e+00 ; -5.617678e-01 ];
Tc_2  = [ -1.048742e+02 ; -8.936755e+01 ; 5.517312e+02 ];
omc_error_2 = [ 1.222044e-03 ; 1.733759e-03 ; 3.251101e-03 ];
Tc_error_2  = [ 9.561241e-01 ; 1.141517e+00 ; 1.304113e+00 ];

%-- Image #3:
omc_3 = [ -2.257192e+00 ; -2.043755e+00 ; 6.618956e-01 ];
Tc_3  = [ -1.602158e+02 ; -8.050706e+01 ; 5.680528e+02 ];
omc_error_3 = [ 1.902398e-03 ; 1.149252e-03 ; 3.424726e-03 ];
Tc_error_3  = [ 9.922926e-01 ; 1.192470e+00 ; 1.334417e+00 ];

%-- Image #4:
omc_4 = [ 1.902292e+00 ; 1.958337e+00 ; 3.174703e-02 ];
Tc_4  = [ 4.130230e+01 ; -1.162369e+02 ; 5.062206e+02 ];
omc_error_4 = [ 1.827590e-03 ; 1.446715e-03 ; 2.705596e-03 ];
Tc_error_4  = [ 8.887335e-01 ; 1.043015e+00 ; 1.261193e+00 ];

%-- Image #5:
omc_5 = [ 2.181905e+00 ; 1.988437e+00 ; 1.663973e-01 ];
Tc_5  = [ 1.039061e+00 ; -1.032443e+02 ; 5.093945e+02 ];
omc_error_5 = [ 1.976821e-03 ; 1.413725e-03 ; 3.235246e-03 ];
Tc_error_5  = [ 8.895302e-01 ; 1.052069e+00 ; 1.257401e+00 ];

%-- Image #6:
omc_6 = [ 1.923792e+00 ; 1.939810e+00 ; -5.392624e-01 ];
Tc_6  = [ -9.559599e+01 ; -1.175224e+02 ; 5.198294e+02 ];
omc_error_6 = [ 1.264898e-03 ; 1.718447e-03 ; 2.769064e-03 ];
Tc_error_6  = [ 9.061579e-01 ; 1.071354e+00 ; 1.238403e+00 ];

%-- Image #7:
omc_7 = [ 1.914327e+00 ; 2.018619e+00 ; -6.505780e-01 ];
Tc_7  = [ 1.378894e+01 ; -1.185086e+02 ; 5.168335e+02 ];
omc_error_7 = [ 1.431770e-03 ; 1.716676e-03 ; 2.714419e-03 ];
Tc_error_7  = [ 9.025903e-01 ; 1.057706e+00 ; 1.182704e+00 ];

%-- Image #8:
omc_8 = [ 2.127737e+00 ; 2.181493e+00 ; -4.237597e-01 ];
Tc_8  = [ 1.566048e+01 ; -8.638397e+01 ; 5.191034e+02 ];
omc_error_8 = [ 1.607409e-03 ; 1.569989e-03 ; 3.380258e-03 ];
Tc_error_8  = [ 9.021784e-01 ; 1.061784e+00 ; 1.243118e+00 ];

%-- Image #9:
omc_9 = [ 2.139430e+00 ; 2.178578e+00 ; -3.448396e-01 ];
Tc_9  = [ -7.111254e+01 ; -8.946168e+01 ; 5.156905e+02 ];
omc_error_9 = [ 1.419225e-03 ; 1.654333e-03 ; 3.295887e-03 ];
Tc_error_9  = [ 8.909792e-01 ; 1.059716e+00 ; 1.251420e+00 ];

%-- Image #10:
omc_10 = [ 2.169531e+00 ; 2.165754e+00 ; -3.017603e-01 ];
Tc_10  = [ -1.384976e+02 ; -9.090430e+01 ; 5.074220e+02 ];
omc_error_10 = [ 1.420043e-03 ; 1.851404e-03 ; 3.554356e-03 ];
Tc_error_10  = [ 8.803949e-01 ; 1.058565e+00 ; 1.254065e+00 ];

%-- Image #11:
omc_11 = [ 1.699196e+00 ; 1.937160e+00 ; -1.360050e-01 ];
Tc_11  = [ -6.551298e+01 ; -1.103395e+02 ; 4.915619e+02 ];
omc_error_11 = [ 1.460347e-03 ; 1.535499e-03 ; 2.475687e-03 ];
Tc_error_11  = [ 8.515672e-01 ; 1.010343e+00 ; 1.206945e+00 ];

%-- Image #12:
omc_12 = [ -2.000905e+00 ; -1.908129e+00 ; 3.854715e-01 ];
Tc_12  = [ -1.827133e+01 ; -9.805795e+01 ; 5.854399e+02 ];
omc_error_12 = [ 1.556532e-03 ; 1.297433e-03 ; 3.401308e-03 ];
Tc_error_12  = [ 1.011541e+00 ; 1.204461e+00 ; 1.370545e+00 ];

%-- Image #13:
omc_13 = [ -2.059798e+00 ; -1.809860e+00 ; 3.609076e-01 ];
Tc_13  = [ -1.341713e+02 ; -9.804999e+01 ; 5.765190e+02 ];
omc_error_13 = [ 1.718082e-03 ; 1.156275e-03 ; 3.344936e-03 ];
Tc_error_13  = [ 1.004077e+00 ; 1.201782e+00 ; 1.362955e+00 ];

