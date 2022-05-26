clc
clear all
close all

xv = linspace(-1, 1, 200);
f = @(x) sin(2*pi*x);
xeq = linspace(-1, 1, 22);

yeq = f(xeq);
ys = yeq + 0.0002 * randn(1, 22);

[pol_eq] = InterpL(xeq, yeq, xv);
[pol_s] = InterpL(xeq, ys, xv);

figure(1)
plot(xeq, yeq,'bo-',xeq, ys, 'r*', xv, pol_eq, 'b-', xv, pol_s, 'r-');
errore = norm(yeq- ys, inf)/norm(yeq, inf);
errore_ris = norm(pol_s - pol_eq, inf)/norm(pol_eq, 1);
