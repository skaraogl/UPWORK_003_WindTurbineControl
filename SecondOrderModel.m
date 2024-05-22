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

% Conversion factor from generator to rotor / 1
konv = omega_r0/omega_g0;

%% NONLINEAR STATE SPACE MODEL
x0 = [1; 1];
u0 = 10;
v = 18;

% Jacobian for x1
Kx1 = getAerodynamics(x0(1),x0(2),v)/J*x0(1)^2 - Dg/J;

A = [Kx1 0; 0 -1/tau_theta];
B = [0; 1/tau_theta];
C = [1 0];
D = 0;