function [IN, N] = traptoll(fun, a, b, toll)
Nmax = 2048;
N = 1;
err = 1;
IN = trapcomp(fun, a, b, N);
while N <= Nmax  && err > toll
    N=2*N;
    I2N = trapcomp(fun, a, b, N);
    if abs(I2N -IN)==0
        N=N/2;
        return
    end
    err = abs(I2N -IN)/3;
    IN = I2N;
end
end