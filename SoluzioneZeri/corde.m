function [result, approssimazioni, iterations] = corde(fun, m, x0, tolx, tolf, NMAX)
if m == 0
    disp('Error');
    result = [];
    approssimazioni = [];
    iterations = [];
end
iterations = 1;
result = x0 - fun(x0)/m;
fx = fun(result);
approssimazioni(iterations) = result;
while iterations < NMAX && abs(fx) > tolf && abs(fun(x0)/m) > tolx*abs(result)
    iterations = iterations + 1;
    result = result - fx/m;
    fx = fun(result);
    approssimazioni(iterations)=result;
end