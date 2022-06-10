clc
clear all
close all
syms x

fx = @(x) sin(x) + sin(5*x);
xv = linspace(0, 2*pi, 100);
x1 = [0:pi/2:2*pi];
x2 = [pi/6, 2*pi/5, 4*pi/5, 8*pi/5, 11*pi/6];
y1 = fx(x1);
y2 = fx(x2);

yy1=InterpL(x1, y1, xv);
yy2=InterpL(x2, y2, xv);

figure
plot(x1, y1, 'ro', x2, y2, 'bo', xv, yy1, 'k-', xv, yy2, 'b-', xv, fx(xv), 'c-');

%PARTE DUE
a=0;
b=2*pi;
toll = 10^-4;
p1 = costruisci_p(x1, y1);
p2 = costruisci_p(x2, y2);

[IN1, N1] = traptoll(p1, a, b, toll);
[IN2, N2] = traptoll(p2, a, b, toll);
[IE] = integral(fx, a, b);
table([IN1, IN2]', [N1, N2]', [IE, IE]')

 fs=sin(x)+sin(5*x)
 Iesatto=double(int(fs,0,2*pi))




