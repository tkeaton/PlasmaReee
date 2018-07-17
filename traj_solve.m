syms x(t) y(t) z(t) Y
%Using SI units
q = 1.60217662*(10^-19);
m_e = 1.60217662*(10*-31);

[Bx, By, Bz] = B_test();
[Ex, Ey, Ez] = E_test();

%DiffiQ to solve (Lorentz Forces)
ode1 = diff(x,2) == (q/m_e)*(Ex(x,y,z) + diff(y)*Bz(x,y,z) - diff(z)*By(x,y,z));
ode2 = diff(y,2) == (q/m_e)*(Ey(x,y,z) + diff(z)*Bx(x,y,z) - diff(x)*Bz(x,y,z));
ode3 = diff(z,2) == (q/m_e)*(Ez(x,y,z) + diff(x)*By(x,y,z) - diff(y)*Bx(x,y,z));

%Reduce order, set I.C., solve numerically
odes = [ode1; ode2; ode3];
[ODEsVF, Subs] = odeToVectorField(odes);
odesfcn = matlabFunction(ODEsVF, 'Vars',{t,Y});

icv = [-.1; 0; .01; 0.; 0.; 0.];

t = linspace(0,.0001,500);
[T,Y] = ode15s(odesfcn, t, icv);

figure
plot3(Y(:,1), Y(:,2), Y(:,3), '-r', 'LineWidth',3)
xlabel 'x';
ylabel 'y';
zlabel 'z';
grid on
