function [IN, N] = traptoll(fun, a, b, toll)
NMAX = 2048;
N = 1;
err = 1;
IN = trapcomp(fun, a, b, N);
while N <= NMAX && err > toll
    N = 2*N;
    I2N = trapcomp(fun, a, b, N);
    if abs(IN - I2N) == 0
        N=N/2;
        return
    end
    err = abs(IN-I2N)/3;
    IN = I2N;
end
end