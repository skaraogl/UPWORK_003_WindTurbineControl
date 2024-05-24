%% This script is for the development of gainscheduled LQR. Strictly speaking the control matrix K is for different operating points of wind speed is developed.
%% Pre-requisites
v_arr = (12:2:24)';

Q = diag([1/100^2 1]);
R = 1;

K_m = zeros(length(v_arr),2);

%% Define A and B matrix of model
for i = 1:length(K_m)
A = [getAerodynamics(x0(1)*1/Ng,x0(2),v_arr(i))/(J*x0(1)^2)-Dg/J 0;
     0 -1/tau_theta];

B = [Dg*omega_0/(J*p*x0(2)); 1/tau_theta];


%% Calculate control matrix K for LQR
K_m(i,:) = lqr(A,B,Q,R);
end