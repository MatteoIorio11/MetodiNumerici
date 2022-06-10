clc
clear all
close all
syms x

tolf = 10^(-10);
nmax = 500;
Lx = @(x) 1/2.*(5.*x.^3 - 3.*x);
Dfx  = @(x) (15*x^2)/2 - 3/2;
figure(1)
xx = linspace(-1, 1, 100);
plot(xx, Lx(xx))
xx = linspace(-1, 1);
x0 = 1;
tolx = tolf;
% si utilizzi il metodo di Newton con valore di innesco 1 e tolleranza 10−10 per determinare lo zero x
% ∗ di L pi`u vicino ad 1
[xn, xkn, itn] = newton(Lx, Dfx, x0, tolx, tolf, nmax);

x0 = -0.5;
% si applichi nuovamente il metodo di Newton con valore di innesco −0.5 per determinare uno zero della
% funzione q(x) = L(x)/(x − x∗), e si verifichi che `e anche uno zero di L(x);
Qx = @(x) Lx(x)./(x - xn);
Dqx = @(x) ((3*x)/2 - (5*x^3)/2)/(x - 5/6)^2 + ((15*x^2)/2 - 3/2)/(x - 5/6);
[xn1, xkn1, itn1] = newton(Qx, Dqx, x0, tolx, tolf, nmax);
[xb1, xk1, it1] = bisezione(Lx, -1, 1, tolx);
[xb2, xk2, it2] = bisezione(Qx, -1, 1, tolx);
Lx(1);
Lx(-1);
% xb1
% xb2
