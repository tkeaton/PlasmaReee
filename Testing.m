[X,Y,Z] = meshgrid(-20:2:20,-20:2:20,-20:2:20);
[Bx, By, Bz] = B_test();
Bfieldx = arrayfun(Bx,X,Y,Z);
Bfieldy = arrayfun(By,X,Y,Z);
Bfieldz = arrayfun(Bz,X,Y,Z);

quiver3(X,Y,Z,Bfieldx,Bfieldy,Bfieldz)
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Quiver Plot of B-Field Solution')