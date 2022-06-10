clc
clear all
close all
syms x

nmax = 500;
tolx = 1e-12;
tolf = tolx;

fx = @(x) exp(x+1) +3*x;
dfx = @(x) exp(x + 1) + 3;
xx = linspace(-1, 2, 100);
figure(1)
plot(xx, fx(xx), 'k-');
title('Grafico funzione');

x0 = 0;
it = 1;
for m=2.5:0.5:4
    [x, xk, it] = corde(fx, x0, m, tolx, tolf, nmax);
    figure
    semilogy(1:it, xk);
    title('x0 Costante M=2.5:0.5:4');
    stima_ordine(xk, it)
end

m=5;
for x0=0:0.5:1
    [x, xk, it] = corde(fx, x0, m, tolx, tolf, nmax);
    figure
    semilogy(1:it, xk);
    title('x0 =0:0.5:1 M costante');
    stima_ordine(xk, it)
end
for x0=-1:0.5:1
    m=dfx(x0);
    if m==0
        break;
    end
    [x, xk, it] =  corde(fx, x0, m, tolx, tolf, nmax);
    figure
    semilogy(1:it, xk);
    title('x0 =-1:0.5:1 M dfx(x0)');
    stima_ordine(xk, it)
end
