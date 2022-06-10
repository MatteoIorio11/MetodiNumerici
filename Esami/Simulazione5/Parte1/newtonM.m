function [x, xk, it] = newtonM(fun, der, m, x0, tolx, tolf, NMAX)
dfx0 = der(x0);
if abs(dfx0) <= eps
    disp('Derivata < eps');
    x = [];
    xk = [];
    it = [];
    return
end
fx0 = fun(x0);
d = fx0/dfx0;
x = x0-m*d;
fx1 = fun(x);
it = 1;
xk(it) = x;
while it <=NMAX && abs(fx1) >= tolf && abs(d) >= tolx*abs(x)
    it = it +1;
    x0 = x;
    dfx0 = der(x0);
    if abs(dfx0) <= eps
        disp('Derivata < eps :( ');
        x = [];
        xk = [];
        it = [];
        return
    end
    fx0 = fun(x0);
    d = fx0/dfx0;
    x = x0 - m*d;
    fx1 = fun(x);
    xk(it) = x;
end