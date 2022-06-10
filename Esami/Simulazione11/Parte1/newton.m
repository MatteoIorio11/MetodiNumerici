function [x1, xk, it] = newton(fun, der, x0, tolx, tolf, nmax)
dfx0 = der(x0);
if abs(dfx0) < eps
    x = [];
    xk = [];
    it = [];
    return
end
it = 1;
fx0 = fun(x0);
d = fx0/dfx0;
x1 = x0 -d;
fx1 = fun(x1);
xk(it) = x1;
while it <=nmax && abs(fx1) > tolf && abs(d) > tolx*abs(x1)
    it = it + 1;
    x0 = x1;
    dfx0 = der(x0);
    if abs(dfx0) < eps
        x = [];
        xk = [];
        it = [];
        return
    end
    fx0 = fun(x0);
    d=fx0/dfx0;
    x0 = x1-d;
    xk(it) = x0;
end
end