function [Bx,By,Bz] = bwrap()

global GX GY GZ GBx GBy GBz

Bx = @(x,y,z) interp3(GX,GY,GZ,GBx,x,y,z,'linear',0);
By = @(x,y,z) interp3(GX,GY,GZ,GBy,x,y,z,'linear',0);
Bz = @(x,y,z) interp3(GX,GY,GZ,GBz,x,y,z,'linear',0);

end