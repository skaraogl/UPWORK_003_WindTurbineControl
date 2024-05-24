%% This model describes the second-order dynamics of a Wind Turbine for constant wind speed
clear;
clc;

%% PARAMETERS
Parameters;

% Combined intertia / kgm²
J = Jr/(Ng^2) + Jg;
% Difference coefficient / 
s = omega_g0 - omega_0/p;
% Generator torque / Nm
Tg = Dg*s;
% Calculated generator power / W
% Pe = Tg*101;

%% NONLINEAR STATE SPACE MODEL
u0 = 0;
x0 = [omega_g0-10; u0];
v = 12;

Aerodynamics;
k2 = p_aer(:,1);
k1 = p_aer(:,2);
k0 = p_aer(:,3);

B = [0; 1/tau_theta];
C = diag([1 1]);

%% 1st approach
% Kx1 = -getAerodynamics(x0(1)*1/Ng,x0(2),v)/(J*x0(1)^2) - Dg/J;
% A = [Kx1 0; 0 -1/tau_theta];

%% 2nd approach
% Aerodynamics;
% a11 = - polyval(p_aer,x0(2))/(J*x0(1)^2) - Dg/J;
% a12 = (2*p_aer(1) + p_aer(2))/(J*x0(1));
% 
% A = [a11 a12; 0 -1/tau_theta];

%% 3rd approach
% Ni = (omega_g_arr == 100);
% 
% p_N = [k2(Ni) k1(Ni) k0(Ni)];
% 
% a11 = - polyval(p_N,x0(2))/(J*x0(1)^2) - Dg/J;
% a12 = (2*p_N(1)*x0(2) + p_N(2))/(J*x0(1));
% 
% A = [a11 a12; 0 -1/tau_theta];

%% 4th approach
% DERIVATIVES;
% A = [Kx1 Kx2; 0 -1/tau_theta];

%% 5th approach
A = [getAerodynamics(x0(1)*1/Ng,x0(2),v)/(J*x0(1)^2)-Dg/J 0;
     0 -1/tau_theta];

B = [Dg*omega_0/(J*p) 0; 0 1/tau_theta];

u0 = [1; u0];

%% LQR
Q = diag([1/0.1^2 1/1^2]);
R = diag([1/100^2 1/10^2]);
K = lqr(A,B,Q,R);