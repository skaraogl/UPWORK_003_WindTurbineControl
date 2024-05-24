Pr = getAerodynamics(x0(1)*1/Ng,x0(2),v);

xdot1_1 = Pr/(J*x0(1)) - Dg*x0(1)/J + Dg*omega_0/(J*p)
xdot1_2 = (Pr/(J*x0(1)^2) - Dg/J)*x0(1) + Dg*omega_0/(J*p)