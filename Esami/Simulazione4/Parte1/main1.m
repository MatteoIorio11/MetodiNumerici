clc
clear all
close all
syms z

toll=10^-4;
a=0;
b=2*pi;
fx = @(x) sin(x)+sin(5*x);
x1= [0 : pi/3 : 2 *pi];
x2 = [pi/6, 2 *pi/5, 4*pi/5, 8*pi/5, 11*pi/6];
xx = linspace(0, 2*pi, 100);
y1 = fx(x1);
y2 = fx(x2);
[a1] = InterpL(x1, y1, xx);
[a2] = InterpL(x2, y2, xx);
%[pol1] = pvalHorner(a1, xx);
%[pol2] = pvalHorner(a2, xx);
figure(1)
plot(xx, fx(xx),'k', x1, y1, 'ro', x2, y2, 'go', xx, a1, 'r-', xx, a2, 'g-');
%COSTRUISCO I POLINOMI
[a1] = diff_divise(x1, y1);
[a2] = diff_divise(x2, y2);
[n] = length(x1);
ps = a1(n);
for k=n-1:-1:1
    ps = ps*(z-x1(k)) + a1(k);
end
p1 = matlabFunction(ps);
[n] = length(x2);
ps = a2(n);
for k=n-1:-1:1
    ps = ps*(z-x2(k)) + a2(k);
end
p2 = matlabFunction(ps);
%RISULTATI ESATTI
Ies1 = integral(p1, a, b);
Ies2 = integral(p2, a, b);

[I1, N1] = traptoll(p1, a, b, toll);
[I2, N2] = traptoll(p2, a, b, toll);

abs(Ies1 - I1)
abs(Ies2 - I2)






