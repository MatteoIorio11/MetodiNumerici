function [x1, xk, it] = bisezione(fun, a, b, tol)
fa = fun(a);
fb = fun(b);
if sign(fa)*sign(fb) >= 0
    disp('Errore nell intervallo')
    x1 = [];
    xk = [];
    it = [];
    return
end
nmax = ceil(log((b-a)/tol) -1);
it = 0;
xk = zeros(nmax, 1);
while it <= nmax && abs(b-a) > tol
    it = it + 1;
    x1 = a+(b-a)*0.5;
    fx1 = fun(x1);
    if fx1 == 0
        return
    elseif sign(fx1) * sign(fa) > 0
        a = x1;
        fa = fx1;
    elseif sign(fx1) *sign(fb) > 0
        b = x1;
        fb = fx1;
    end
    xk(it) = x1;
end
end