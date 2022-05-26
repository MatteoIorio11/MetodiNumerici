clc
clear all
close all

xv = linspace(-1, 1, 22);
f = @(x) sin(2*pi*x);
xeq = linspace(-1, 1, 23);
yeq = f(xeq);
[pol_eq, coeff] = interpN(xeq, yeq, xv);

ys = yeq + ;
[pol_s, coff] = interpN(xeq, ys, xv);
figure(1)
semilogy(xv, pol_eq, xv, ys);
