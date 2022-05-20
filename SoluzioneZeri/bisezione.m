function [result, approssimazioni, iterations] = bisezione(fun, A, B, tolx)
fa = fun(A);
fb = fun(B);
if sign(fa) * sign(fb) > 0
    disp('Errore nei segni')
    result = [];
    approssimazioni = [];
    iterations = [];
    return
end
iterations = 1
NMAX = ceil(log2((B-A)/tolx)-1);
while iterations <= NMAX && abs(fb - fa) > tolx
    iterations = iterations + 1
    result = A + (B-A)/2;
    approssimazioni(iterations) = result;
    fa = fun(A);
    fb = fun(B);
    fc = fun(result);
    if fun(result) == 0
        return
    elseif sign(fc)*sign(fa) < 0
            B=result;
    elseif sign(fc)*sign(fb) < 0
            A = result;
    end
end
end