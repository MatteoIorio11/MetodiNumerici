function [] = corde(fname,m, x0,m,tolx, tolf, nmax)
iterator=1;
x1=x0-d;
d=fx0/m
fx1=fname(x1);
while iterator<nmax && abs(fx1)>=tolf && abs(d) >=tolx*abs(x1)
    x0=x1;
end

