function [Ex,Ey,Ez] = esphere(V,x,y,z)

%Constants in kg and m
epnaut = 8.854187*(10^-12);
k = 1/(4*pi*epnaut);
R = 0.1;
Q = (V*R)/k;

Ex = (Q*x)/(4*pi*epnaut*(x^2+y^2+z^2)^(3/2));
Ey = (Q*y)/(4*pi*epnaut*(x^2+y^2+z^2)^(3/2));
Ez = (Q*z)/(4*pi*epnaut*(x^2+y^2+z^2)^(3/2));

end
