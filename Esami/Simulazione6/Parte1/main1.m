clc
clear all
close all
syms al

N = 6;
a = 0;
b = 2;
alphas = linspace(-5/2, -3/2, 100);
n = length(alphas);
for i=1:n
    alpha = alphas(i);
    fx = @(x) x.^5 + 2*alpha*x.^4 +4*x.^3 + 4*(alpha^2)*x.^2+3;
    Itilde(i) = trapcomp(fx, a, b, N);
end
Iesatto= 32/3*al+64/5*al+98/3;
Iesattos = matlabFunction(Iesatto);
Ea = abs(Itilde - Iesattos(alphas));
figure
plot(alphas, Ea);
[min, val] = min(Ea);
alphas(val)
hold on
plot(alphas(val),Ea(val),'ro')




