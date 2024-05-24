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
% @ 14 m/s wind speed
u0 = 11.9;
v = 14;

% @ 16 m/s wind speed
% u0 = 16.2;
% v = 16;

% @ 18 m/s wind speed
% u0 = 19.1;
% v = 18;

% @ 20 m/s wind speed
% u0 = 21.2;
% v = 20;

% @22 m/s wind speed
% u0 = 22.8;
% v = 22;

x0 = [omega_g0; u0];
set_param('SecOrdMdl_Prototype/WIND','Value',num2str(v))

C = diag([1 1]);

A = [getAerodynamics(x0(1)*1/Ng,x0(2),v)/(J*x0(1)^2)-Dg/J 0;
     0 -1/tau_theta];

B = [Dg*omega_0/(J*p*x0(2)); 1/tau_theta];

v_stair = [1 14; 1 16; 2 16; 2 18; 3 18; 3 20; 4 20; 4 22; 5 22];

%% LQR
% Q = diag([1/0.1^2 1/1^2]);
% R = diag([1/100^2 1/10^2]);

% For v = 14 m/s
Q = diag([0.16 100]);
R = 1;

% For v = 16 m/s
% Q = diag([0.16 480]);
% R = 1;

% For v = 18 m/s
% Q = diag([0.16 1320]);
% R = 1;

% For v = 20 m/s
% Q = diag([0.16 2880]);
% R = 1;

% For v = 22 m/s
% Q = diag([0.16 5600]);
% R = 1;

K = lqr(A,B,Q,R);