clc
clear all
close all
f=@(x) [2*x(1)-cos(x(2));sin(x(1))+2*x(2)];
jac=@(x)[2 sin(x(2)); cos(x(1)) 2];

xm=[-4:0.5:4];
ym=[-4:0.5:4];
[X,Y]=meshgrid(xm, ym);
Z=2*X-cos(Y);
Z1=sin(X)+2*Y;

figure
mesh(X,Y,Z);
hold on
contour(X,Y,Z,[0,0],'k'); 
figure
mesh(X,Y,Z1);
hold on
contour(X,Y,Z1,[0,0],'r'); 