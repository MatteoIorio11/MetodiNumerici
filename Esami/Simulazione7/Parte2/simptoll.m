function [I, n] = simptoll(fun, a, b, toll)
nmax = 2048;
n = 1;
err = 1;
I = trapcomp(fun, a, b, n);
while n<=nmax && err > toll
    n=2*n;
    I2N = simpcomp(fun, a, b, n);
    if abs(I - I2N) == 0
        n=n/2;
        return
    end
    err = abs(I-I2N)/15;
    I=I2N;
end
end