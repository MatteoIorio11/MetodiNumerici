clc
clear all
close all

f=@(x) [2*x(1)-cos(x(2));sin(x(1))+2*x(2)];
sistema=@ (x) [x(1)^2+x(2)^2 - 9; x(1)+x(2)-3];
jacobian=@ (x) [2*x(1) 2*x(2); 1 1];
jac=@ (x) [2 sin(x(2));cos(x(1)) 2];

xx=[-4:0.5:4];
yy=[-4:0.5:4];
[X,Y]=meshgrid(xx,yy);

Z1=X.^2 + Y.^2 - 9;
Z2=X + Y - 3;

figure 
mesh(X,Y,Z1);
hold on
contour(X,Y,Z1, [0 0], 'r-', 'linewidth', 2);

figure 
mesh(X,Y,Z2);
hold on
contour(X,Y,Z2, [0 0], 'r-', 'linewidth', 2);

%Punti del piano in cui fx1 e fx2 valgono 0, bisogna cercare l'intersezione
%di entrambe le funzioni
figure
contour(X,Y,Z1, [0 0], 'r-', 'linewidth', 2);
hold on
contour(X,Y,Z2, [0 0], 'g-', 'linewidth', 2);
x0=[-1;3];
tolx = 1e-10;
tolf = tolx;
NMAX=200;
[result, Error, x_values,iterations] = newtonFunctionSys(sistema, jacobian, x0, tolx, tolf, NMAX)
plot3(result(1), result(2), sistema([result(1), result(2)]), 'ro');
figure
semilogy(1:iterations, Error, 'r-o');

% Z1=2*X-cos(Y);
% Z2=sin(X)+2*Y;
% 
% figure 
% mesh(X,Y,Z1);
% hold on
% contour(X,Y,Z1, [0 0], 'r-', 'linewidth', 2);
% 
% figure 
% mesh(X,Y,Z2);
% hold on
% contour(X,Y,Z2, [0 0], 'r-', 'linewidth', 2);
% 
% %Punti del piano in cui fx1 e fx2 valgono 0, bisogna cercare l'intersezione
% %di entrambe le funzioni
% figure
% contour(X,Y,Z1, [0 0], 'r-', 'linewidth', 2);
% hold on
% contour(X,Y,Z2, [0 0], 'g-', 'linewidth', 2);
% x0=[-2;2];
% tolx = 1e-10;
% tolf = tolx;
% NMAX=200;
% [result, Error, x_values,iterations] = newtonFunctionSys(f, jac, x0, tolx, tolf, NMAX)
% plot3(x_values(1), x_values(2), f([x_values(1), x_values(2)]), 'ro');
% figure
% semilogy(1:iterations, Error, 'r-o');
