model = createpde(3);
importGeometry(model,'Vert Space and Mag.stl');

pdegplot(model,'FaceLabels','on','FaceAlpha',0.5);
figure

Q0 = [0 0 0;0 0 0;0 0 0];
Q3 = [2 0 0;0 2 0;0 0 2];
G3 = [2 2 2];
G0 = [0 0 0];

applyBoundaryCondition(model,'neumann','Face',[1,2,3,4,5,6],'q',Q0,'g',G0);
applyBoundaryCondition(model,'neumann','Face',[8,9],'q',Q0,'g',G0);
applyBoundaryCondition(model,'neumann','Face',7,'q',Q0,'g',@surfcurk);
specifyCoefficients(model,'m',0,...
                          'd',0,...
                          'c',[1;1;1],...
                          'a',0,... 
                          'f',[0;0;0]);
generateMesh(model);

results = solvepde(model);
pdeplot3D(model,'ColorMapData',results.NodalSolution(:,1))
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Sol X')
figure

pdeplot3D(model,'ColorMapData',results.NodalSolution(:,2))
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Sol Y')
figure

pdeplot3D(model,'ColorMapData',results.NodalSolution(:,3))
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Sol Z')
figure

%Quiver Plot
[X,Y,Z] = meshgrid(80:2:120,80:2:120,80:2:120);
uintrp = interpolateSolution(results,X,Y,Z,[1,2,3]);

sol1 = reshape(uintrp(:,1),size(X));
sol2 = reshape(uintrp(:,2),size(Y));
sol3 = reshape(uintrp(:,3),size(Z));

quiver3(X,Y,Z,sol1,sol2,sol3)
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Quiver Plot of Vector Potential Solution')
figure

[Bfieldx,Bfieldy,Bfieldz] = curl(sol1,sol2,sol3);

quiver3(X,Y,Z,Bfieldx,Bfieldy,Bfieldz)
axis equal
xlabel 'x'
ylabel 'y'
zlabel 'z'
title('Quiver Plot of B-Field Solution')


%hold on
%[sx,sy,sz] = meshgrid([1,46],1:20:200,1:20:200);
%streamline(X,Y,Z,sol1,sol2,sol3)
%title('Quiver Plot with Streamlines')
%hold off

%pdeplot3D(model,'ColorMapData',results.NodalSolution(:,21))