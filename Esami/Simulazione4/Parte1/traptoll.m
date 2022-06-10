function [I, N] = traptoll(fun, a, b, toll)
nmax = 2048;
N = 1;
err = 1;
I = trapcomp(fun, a, b, N);
while N <= nmax && err > toll
    N = 2*N;
    I2N = trapcomp(fun, a, b, N);
    err = abs(I-I2N)/3;
    I = I2N;
end
end