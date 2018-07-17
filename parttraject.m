syms x(t) y(t) z(t) vx(t) vy(t) vz(t)
%Units of kg and seconds
q = 1.60217662*(10^-19);
B = 2;
m_e = 1.60217662*(10^-31);
a = (q*B)/m_e;

%DiffiQ to solve
ode1 = diff(x) == vx;
ode2 = diff(y) == vy;
ode3 = diff(z) == vz;
ode4 = diff(vx) == a*vy;
ode5 = diff(vy) == -a*vx;
ode6 = diff(vz) == 0;
odes = [ode1; ode2; ode3; ode4; ode5; ode6];

%Initial Conditions
condx1 = x(0) == 0;
condy1 = y(0) == 0;
condz1 = z(0) == 0;
condvx1 = vx(0) == (1*10^6);
condvy1 = vy(0) == (2*10^6);
condvz1 = vz(0) == (2*10^6);
conds = [condx1; condy1; condz1; condvx1; condvy1; condvz1];

%Solutions
S = dsolve(odes,conds);
xSol(t) = S.x
ySol(t) = S.y
zSol(t) = S.z

%[xSol(t), ySol(t), zSol(t)] = dsolve(odes);

%{
Initial Conditions
condx1 = x(0) == 1;
condy1 = y(0) == 1;
condz1 = z(0) == 0;
%}
%{
%Derivative Initial Conditions
condvx1 = diff(x) == 1;
condvy1 = diff(y) == 2;
condvz1 = diff(z) == 2;


Sx = matlabFunction(xSol);
Sy = matlabFunction(ySol);
Sz = matlabFunction(zSol);

x = Sx;
y = Sy;
z = Sz;
%}
%Plot Trajectory
%t = 0:pi/50:16*pi*m*(1/(q*B));
t = linspace(0,16*pi*m_e*(1/(q*B)),5000);
%{
C13 == ...
xv == Sx(t,C14,Sz(t,C13));
yv = Sx(t,C14,Sz(t,C13));
zv = Sz(t,C13);
%}

figure(1)
plot3(xSol(t),ySol(t),zSol(t),'r','LineWidth',3)

