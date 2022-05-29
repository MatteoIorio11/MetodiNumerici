function [x1,xk,it]=newton(fname,fpname,x0,tolx,tolf,nmax)
fx0=fname(x0);
dfx0=fpname(x0);
if abs(dfx0)>eps
    x1 = x0 - fx0/dfx0;
else
    fprintf('Derivata nulla in x0 - EXIT \n')
    x1 = [];
    xk = [];
    it = [];
    return
end
it = 1
fx1 = fname(x1)
xk(it) = x1;
while it <= nmax && abs(fx1) > tolf && abs(m*fx0) > tolx*abs(x1)
    it = it + 1
    x0=x1;
    fx0=fname(x0);
    dfx0=fpname(x0);
    if abs(dfx0)>eps
         x1 = x0 - fx0/dfx0;
    else
        fprintf('Derivata nulla in xi - EXIT \n')
        disp(dfx0)
        break
    end
end
if it==nmax
    fprintf('raggiunto massimo numero di iterazioni \n');
end

