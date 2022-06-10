function [IN, N] = simptoll(fun, a, b, tol)
Nmax = 2048;
N = 1;
err = 1;
IN = trapcomp(fun, a, b, N);
while N <= Nmax && err > tol
    N = N*2;
    I2N = simpcomp(fun, a, b, N);
    if abs(I2N - IN) == 0
        N = N/2;
        return
    end
    err = abs(I2N - IN)/15;
    IN = I2N;
end