function [IN, N] = traptoll(fun, a, b, tol)
Nmax = 2048;
err = 1;
N = 1;
IN = TrapComp(fun, a, b, N);
while N<=Nmax && err > tol
    N = 2*N;
    I2N = TrapComp(fun, a, b, N);
    err = abs(IN-I2N)/3;
    IN = I2N;
end
end
