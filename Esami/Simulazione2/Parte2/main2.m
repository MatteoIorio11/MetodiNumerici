clc
clear all
close all


x = [0, 4, 0, 5];
y = [0, 0, 4, 6];
%PARTE UNO TROVO I COEFFICIENTI E I TERMINI NOTI.
A = [0, 0, 1;
     4, 0, 1;
     0, 4, 1;
     5, 6, 1];
b = [0, -16, -16, - 61]';
% ESEGUO QR
[Q, R] = qr(A);
% TROVO a
[n] = size(A,2);
h = Q'*b;
[as, f] = Usolve(R(1:n, 1:n), h(1:n));
val = norm(A*as - b, 2)^2;

xc = -as(1)/2;
yc = -as(1)/2;
r = sqrt((as(1))^2/4 + as(2)^2/4 - as(3));
t = linspace(0, 2*pi, 200);
xe = r*cos(t) + xc;
ye = r*sin(t) + yc;

figure
plot(x, y, 'ro', xe, ye, 'b');










