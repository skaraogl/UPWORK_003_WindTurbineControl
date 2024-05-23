%% This script is for calculating the derivatives of the model equations
%% SECOND ORDER
syms x1 x2 x3
F = @(x1,x2,x3) getAerodynamics(x1,x2,x3)/(J*x1) - Dg*x1/J + (Dg*omega_0)/(J*p);

X1(x1,x2,x3) = diff(F(x1,x2,x3),x1);
X2(x1,x2,x3) = diff(F(x1,x2,x3),x2);

Kx1 = double(X1(x0(1),x0(2),v));
Kx2 = double(X2(x0(1),x0(2),v));
