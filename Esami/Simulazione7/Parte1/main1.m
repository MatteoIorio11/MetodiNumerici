clc
clear all
close all


N = 3;
fx = @(x) sin(x)+sin(6*x);
xx = linspace(-pi/2, 5*pi/2, 200);
x1 = [0:2/7*pi:2*pi]';
x2 =[pi/7, pi/3,2*pi/3, 4*pi/3, 5*pi/3, 13*pi/7]';
y1 = fx(x1);
y2 = fx(x2);

A1 = costruisci_A(x1, N+1);
A2 = costruisci_A(x2, N+1);
[a1] = metodoQR(A1, y1);
[a2] = metodoQR(A2, y2);
[pval1] = pvalHorner(a1, xx);
[pval2] = pvalHorner(a2, xx);
figure(1)
plot(xx, fx(xx), 'k:', x1, y1, 'ro', x2, y2, 'go', xx, pval1, 'b-', xx, pval2, 'c-');
legend('Funzione', 'Primo Set', 'Secondo Set', 'Prima approssimazione', 'Seconda approssimazione')
title('Approssimazioni con metodoQR');


[yy1] = InterpL(x1', y1', xx);
[yy2] = InterpL(x2', y2', xx);

figure(2)
plot(xx, fx(xx), 'c-', x1, y1, 'ro', xx, yy1, 'k-', x2, y2, 'go', xx, yy2, 'b-');
title('Interpolazione di Lagrange');


