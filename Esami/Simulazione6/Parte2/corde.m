function [x1, xk, it] = corde(fun, x0, m, tolx, tolf, nmax)
fx0 = fun(x0);
d = fx0/m;
x1 = x0-d;
fx1 = fun(x1);
it = 1;
xk(it) = x1;
while it <= nmax && abs(fx1) >= tolf && abs(d) >= tolx*abs(x1)
    it = it+1;
    x0 = x1;
    fx0 = fun(x0);
    d = fx0/m;
    x1 = x0 -d;
    fx1 = fun(x1);
    xk(it) = x1;
end
end