
model = createpde(3);
importGeometry(model,'mag with vac space.stl');
pdegplot(model,'FaceLabels','on','FaceAlpha',0.5);
axis equal
figure

Q0 = [0 0 0;0 0 0;0 0 0];
G0 = [0 0 0];

applyBoundaryCondition(model,'neumann','Face',[1,2,3],'q',Q0,'g',G0);
applyBoundaryCondition(model,'neumann','Face',[4,5,6],'q',Q0,'g',@surfcurk);
specifyCoefficients(model,'m',0,...
                          'd',0,...
                          'c',[1;1;1],...
                          'a',0,...
                          'f',[0;0;0]);
                      
generateMesh(model,'Hmax',3);
results = solvepde(model);

%{
%This is just a way to visually confirm boundary conditions on the faces of the STL geometry are correct
pdeplot3D(model,'ColorMapData',results.NodalSolution(:,1))
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Boundary Condition Sol X Check')
figure

pdeplot3D(model,'ColorMapData',results.NodalSolution(:,2))
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Boundary Condition Sol Y Check')
figure

pdeplot3D(model,'ColorMapData',results.NodalSolution(:,3))
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Boundary Condition Sol Z Check')
figure
%}

global GX GY GZ

%Quiver Plot
[GX,GY,GZ] = meshgrid(-10:0.5:40,-10:0.5:40,-10:0.5:35);
uintrp = interpolateSolution(results,GX,GY,GZ,[1,2,3]);
uintrp(isnan(uintrp))= 0;

sol1 = reshape(uintrp(:,1),size(GX));
sol2 = reshape(uintrp(:,2),size(GY));
sol3 = reshape(uintrp(:,3),size(GZ));

quiver3(GX,GY,GZ,sol1,sol2,sol3)
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Quiver Plot of Vector Potential Solution')
figure

global GBx GBy GBz

[GBx,GBy,GBz] = curl(sol1*(.0001),sol2*(.0001),sol3*(.0001));

quiver3(GX,GY,GZ,GBx,GBy,GBz)
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Quiver Plot of B-Field Solution')

%{
%An initial attempt to import cylindrical geometry in the plot to model the physical magnet
gm = multicylinder(0.635,2.54)
model = createpde
model.Geometry = gm
pdegplot(model,'CellLabels','on')
hold off;
%}