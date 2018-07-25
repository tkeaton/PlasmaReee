
%Initial Positions and Velocities
%Interesting Trajectory 1: [25; 25; 30; -1E+6; 0.; 0.]
%Interesting Trajectory 2: 

icv = [25; 25; 30; -1E+6; 0.; 0.];

%Time Span
tspan = [0 0.00001];
[T,Y] = ode15s(@odefun, tspan, icv);

[Ex,Ey,Ez] = efield(1500,0.1);

figure
plot3(Y(:,1), Y(:,2), Y(:,3), '-r', 'LineWidth',3)
xlabel 'x';
ylabel 'y';
zlabel 'z';
grid on
hold on

global GX GY GZ GBx GBy GBz
quiver3(GX,GY,GZ,GBx,GBy,GBz)
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('B-Field and Particle Trajectory Solution')

quiver3(X,Y,Z,Ex,Ey,Ez,'color',[0 0 3])
hold off

