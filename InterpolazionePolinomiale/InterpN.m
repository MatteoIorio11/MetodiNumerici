function [yv, a] = InterpN(x, y, xv)
%Costruzione dei coefficienti a del polinomio interolatore di Newton

a=diff_divise(x, y);
%Valutazione il polinomio interpolatore di Newton nei punti del vettore xv
%con lo schema Horner
yv = pvalHornerN(a, x, xv);
