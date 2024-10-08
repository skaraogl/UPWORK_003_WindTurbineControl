%% This model describes the second-order dynamics of a Wind Turbine for constant wind speed
clear;
clc;

%% PARAMETERS
Parameters;

%% NONLINEAR STATE SPACE MODEL
x0 = [omega_r0; omega_g0; 6.55*1e-3; 19.1; 2130];
u0 = x0(4);
v = 18;

DERIVATIVES_5;

A = [K11 Ds/(Jr*Ng) -Ks/Jr K14 0;
     Ds/(Jg*Ng) -Ds/(Ng^2*Jg) Ks/(Jg*Ng) 0 -1/Jg;
     1 -1/Ng 0 0 0;
     0 0 0 -1/tau_theta 0;
     0 0 0 0 -1/tau_T];

B = [0 0;
     0 0;
     0 0;
     1/tau_theta 0;
     0 1/tau_T];

C = diag([1 1 0 1 1]);

%% LQR
K = lqr(A,B,diag([1/0.1^2 1/0.1^2 1/1^2 1/0.5^2 1/1^2]),diag([1/0.1^2 1/10^2]));