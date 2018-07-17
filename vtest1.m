d = 1;
k = 1;
q = 1;


[x,y,z] = meshgrid(-2:.05:2);
% Potential Components
Vpot = k*q*d*z./(x.^2+y.^2+z.^2).^(3/2);
xslice = [-1,0,1];   
lvls = -5:0.1:5;
contourslice(x,y,z,Vpot,xslice,[],[],lvls)
colorbar
view(3)
grid on