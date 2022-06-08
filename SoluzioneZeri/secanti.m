function [x1,xk,it]=secanti(fname,xm1,x0,tolx,tolf,nmax)

fxm1=fname(xm1);
fx0=fname(x0); 
% m = (fxm1 - fx0)/(xm1 - x0)
% d = fx0/m
d=fx0*(x0-xm1)/(fx0-fxm1);
x1=x0-d;
fx1=feval(fname,x1); % identico a dire fx1 = fname(x1)
it=1;
xk(it)=x1;
%fprintf('it=%d  x=%8.15f \n',it,x1);
while it<nmax && abs(fx1)>=tolf && abs(d)>=tolx*abs(x1)
    xm1=x0;
    x0=x1;
    fxm1=fname(xm1);
    fx0=fname(x0); 
    d=fx0*(x0-xm1)/(fx0-fxm1);
    x1=x0-d;
    fx1=fname(x1);
    it=it+1;
    xk(it)=x1;
    %fprintf('it=%d  x=%8.15f \n',it,x1);
end
if it==nmax
   fprintf('raggiunto massimo numero di iterazioni \n');
end
