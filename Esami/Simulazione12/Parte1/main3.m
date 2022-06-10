clc
clear all
close all


n = 21;
fx = @(x) sin(2*pi*x);
xx = linspace(-1, 1, n+1);
xv = linspace(-1, 1, 100);
yy = fx(xx);
rnd = 0.0002*randn(1, 22);
yt = yy + rnd;
[yye] = InterpN(xx, yy, xv);
[yyi] = InterpN(xx, yt, xv);
figure(1)
plot(xv, yyi, 'k-', xx, yt, 'ro');
figure(2)
plot(xv, yye, 'b-', xx, yy, 'go');

