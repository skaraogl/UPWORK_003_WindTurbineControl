%% WIND TURBINE DATA
% Nominal output power / W
P_e0 = 225*1e3;
% Nominal rotor speed / rad/sec
omega_r0 = 4.29;
% Nominal generator speed / rad/sec
omega_g0 = 105.62;
% Rotor intertia / kgm²
Jr = 90000;
% Generator intertia / kgm²
Jg = 10;
% Spring coefficient of drive train / N/m
Ks = 8*1e6;
% Damping coefficient of drive train / s^-1
Ds = 8*1e4;
% Damping coefficient of generator / s^-1
Dg = 2365;
% Gear ratio / 1
Ng = 24.6;
% Generator pole pairs / 1
p = 3;
% Blade length / m
R = 14.5;
% Pitch actuator time constant / sec
tau_theta = 0.15;
% Generator time constant / sec
tau_T = 0.1;
% Minimum pitching angle / deg
theta_min = -1;
% Maximum pitching angle / deg
theta_max = 25;
% Maximum pitching rate / deg/sec
theta_dot_max = 10;

%% WIND MODEL DATA
% Nacelle height / m
z = 45;
% Altitude of lowest inversion / m
zi = 1000;
% Turbulent intensity / %
tau_t = 0.12;

%% ADDITIONAL DATA
% Air density / kgm³
rho = 1.2;
% Grid frequency / rad/sec
omega_0 = 2*pi*50;