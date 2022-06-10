function [IN, n] = traptoll(fun, a, b, toll)
nmax = 2048;
n=1;
err=1;
IN = trapcomp(fun, a, b, n);
while n <=nmax && err > toll
    n=n*2;
    I2N = trapcomp(fun, a, b, n);
    if abs(IN-I2N)==0
        n=n/2;
        return
    end
    err = abs(IN - I2N)/3;
    IN = I2N;
end
end