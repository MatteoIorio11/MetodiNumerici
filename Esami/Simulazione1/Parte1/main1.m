clc
clear all
close all

fun = @(x) 5.5*(1-exp(-0.05.*x)).*sin(x.^2);
figure
fplot(fun)
it = 1;
tol = 1.e-8;
xs = zeros(6, 1);
inter = zeros(6, 1);
for i=0:5
    xs(it) = 1/2 + 2*i;
    [I, N] = simptoll(fun, 0, xs(it), tol);
    inter(it) = N;
    ys(it) = I * ( 2/pi );
    ye(it) = ( 2/pi ) * integral(fun, 0, xs(it));
    it = it + 1;
end

xx = linspace(min(xs), max(xs), 200);
[yy] = interpL(xs', ys, xx);
figure
plot(xs, ys, 'ro', xx, yy, 'b-');

table(xs, ys', inter)




