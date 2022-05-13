function [result, approssimazioni, iterations] = corde(fun, A, B, x0, tolx, tolf, NMAX)
fa = fun(A);
fb = fun(B);
%Creo il coefficiente angolare
m = (fb - fa)/(b-a);
if m == 0
    disp('Error');
    result = [];
    approssimazioni = [];
    iterations = [];
end
iterations = 1;
approssimazioni = [];
result = x0 - fun(x0)/m;
fx = fun(result);
while iterations < NMAX && abs(fx) > tolf && abs(fun(x0)/m) > tolx*abs(result)
    result = result - fx/m;
    fx = fun(result);
    approssimazioni(iterations)=result;
    iterations = iterations + 1;
end