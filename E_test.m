function [Ex, Ey, Ez] = E_test()
%B_TEST Summary of this function goes here
%   Detailed explanation goes here
syms x y z
k = 8.99*10^9;
q_eff = 1*10^-9;
r = [x, y, z];
E = (k*q_eff/norm(r)^3)*r;
Ex = matlabFunction(E(1));
Ey = matlabFunction(E(2));
Ez = matlabFunction(E(3));
end

