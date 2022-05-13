function [result, approssimazioni, iterations] = regula_falsi(fun, A, B, tolx, NMAX)
fa = fun(A);
fb = fun(B);
if sign(fa) * sign(b) > 0
    disp('Errorre ')
    result = [];
    approssimazioni = [];
    iterations = [];
    return
end
iterations = 1;
fx = fa;
approssimazioni=[];
while iterations < NMAX && abs(B- A) > tolx && abs(fx) >tolx
    result = A - fa*((B-A)/(fb-fa));
    approssimazioni(iterations) = result;
    fa = fun(A);
    fb = fun(B);
    fx = fun(result);
    if fun(result) == 0
        return
    elseif sign(fa) * sign(fx) > 0
        B = result;
    elseif sign(fb) * sign(fx) > 0
        A = result;
    end
    iterations = iterations+1;
end
end