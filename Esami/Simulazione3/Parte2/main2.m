clc
clear all
close all
syms z

toll = 10^-5;
b=3;
a=1;
n=3; %  polinomio di grado 3
fx = @(x) x-sqrt(x-1);
x=linspace(1, 3, n+1);
y = fx(x);
xx = linspace(1, 3, 100);
[pol, a] = interpN(x, y, xx);
figure
plot(x, y, 'ro', xx, pol, 'b-');
n = length(x);
% Costruisco la funzione del polinomio
ps = a(n);
for k=n-1:-1:1
    ps = ps*(z-x(k)) + a(k);
end
p = matlabFunction(ps);
Ies1 = 2.114381916835873;
Ies2 = 2.168048769926493;
[I1, N1] = simptoll(fx, a, b, toll);
[I2, N2] = simptoll(p, a, b, toll);
table(N1, N2)

abs(Ies1 - I1)
abs(Ies2 - I2)


