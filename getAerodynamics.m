function [P,cp] = getAerodynamics(omega,theta,v)
%GETAERODYNAMICS Summary of this function goes here
%   Detailed explanation goes here

R = 14.5;
rho = 1.2;

lambda = v/(R*omega);
lambda_t = 1/(1/(lambda^-1 + 0.12*theta) - 0.0035/((1.5*theta)^3 + 1));

cp = 0.22*(116/lambda_t - 0.6*theta - 5)*exp(-12.5/lambda_t);

P = 1/2*rho*pi*R^2*v^3*cp;

end

