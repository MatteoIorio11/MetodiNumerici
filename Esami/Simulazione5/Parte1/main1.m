clc
clear all
close all
syms x

tolx=1.e-12;
tolf = tolx;
nmax = 200;
fx = @(x) x-2*sqrt(x-1);
df = @(x) 1 - 1/(x - 1)^(1/2);
xx = linspace(1, 3, 100);
yy = fx(xx);
figure(1)
plot(xx, yy, 'b-');
f = x-2*sqrt(x-1);
d1 = diff(f, 1, x);
%  si stabilisca quante radici reali ha f nellsintervallo [1, 3] e si giustifichi la risposta
val1 = solve(f)
val2 = solve(d1)
disp('Il numero di radici reali di F sono 2');
%  si costruisca un metodo iterativo che, partendo da x(0) = 3, converga ad α (zero di f), quadraticamente;
m = 2;
x0 = 3;
[x, xk, it] = newtonM(fx, df, m, x0, tolx, tolf, nmax);
[ordine] = stima_ordine(xk, it);
figure(2)
semilogy(1:it, abs(xk), 'r-');

% si stabilisca se il metodo iterativo proposto al punto b) pu`o convergere ad α quadraticamente anche
% partendo dall%estremo sinistro dell intervallo, ossia da x
% (0) = 1, e si giustifichi la risposta
tolf = 1.e-15;
tolx = tolf;
fx(1)
df(1)
x0 = 1;
% Tale funzione non converge nel valore esatto poiche essendo newtown a
% convergenza locale, il punto x=1 risulta troppo lointano affinche questo
% riersca a farlo convergere nella soluzione esatta
[x, xk, it] = newtonM(fx, df, m, x0, tolx, tolf, nmax);






