function [Ex,Ey,Ez] = efield(V,R_s)

    epnaut = 8.854187E-12;
    k = 1/(4*pi*epnaut);
    Q = (V*R_s)/k;

    [X,Y,Z] = meshgrid(-10:0.5:40,-10:0.5:40,-10:0.5:35);
    
    Ex = (X.*Q)./(4*pi*epnaut*(X.^2+Y.^2+Z.^2).^(3/2));
    Ey = (Y.*Q)./(4*pi*epnaut*(X.^2+Y.^2+Z.^2).^(3/2));
    Ez = (Z.*Q)./(4*pi*epnaut*(X.^2+Y.^2+Z.^2).^(3/2));

%Everything below this line is just for visual confirmation that the
%E-field looks correct

quiver3(X,Y,Z,Ex,Ey,Ez)
axis equal
xlabel 'x in meters'
ylabel 'y in metere'
zlabel 'z in meters'
title('E-field Solution')
end