function [result, approssimazioni, iterations] = newtonMod(fun,deri, x0,molt, tolx, tolf, NMAX)
m = deri(x0);
if m == 0
    disp('Errore')
    result = [];
    approssimazioni = [];
    iterations = [];
    return
end
fx0 = fun(x0);
result = x0 - molt * fx0/m;
fx = fun(result);
iterations = 1;
while iterations < NMAX && abs(fx) >= tolf && abs(fx0*m) > tolx*abs(result)
    result = x0 -molt* fx0/m;
    x0=result;
    fx=fun(result);
    fx0 = fx;
    m = deri(x0);
    if m == 0
        disp('Errore')
        result = [];
        approssimazioni = [];
        iterations = [];
        return
    end
    iterations = iterations + 1;
end
end