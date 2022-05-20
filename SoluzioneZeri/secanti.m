function [result, approssimazioni, iterations] = secanti(fun, x0, x1, tolx, tolf, NMAX)
m = (fun(x1) - fun(x0))/(x1 - x0);
if m == 0
    disp('Errore')
    result = [];
    approssimazioni = [];
    iterations = [];
    return
end
iterations = 1;
fx1 = fun(x1);
fx0 = fun(x0);
result = x1 - fx1/m;
fx = fun(result);
approssimazioni(iterations) = result;
while iterations < NMAX && abs(fx)>= tolf && abs(fx0*m) > tolx*abs(result)
    iterations = iterations+1;
    result = x1 - fx1/m;
    approssimazioni(iterations) = result;
    x0 = x1;
    x1 = result;
    fx0 = fun(x0);
    fx1 = fun(x1);
    fx = fun(result);
    m = (fx1 - fx0)/(x1 - x0);
    if m == 0
        disp('Errore')
        result = [];
        approssimazioni = [];
        iterations = [];
        return
    end
end
end