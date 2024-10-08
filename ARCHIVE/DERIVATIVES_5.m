%% This script is for calculating the derivatives of the model equations
%% SECOND ORDER
syms x1 x4 x6
F = @(x1,x4,x6) getAerodynamics(x1,x4,x6);

F1(x1,x4,x6) = diff(F(x1,x4,x6),x1);
F4(x1,x4,x6) = diff(F(x1,x4,x6),x4);

K11 = double(F1(x0(1),x0(4),v)/(x0(1)*Jr) - getAerodynamics(x0(1),x0(4),v)/(x0(1)^2*Jr) - Ds/Jr);
K14 = double(F4(x0(1),x0(4),v)/(x0(1)*Jr));
