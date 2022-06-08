function [x1,xk,it]=newton(fname,fpname,x0,tolx,tolf,nmax)

%fpname è la derivata prima di fname

fx0=fname(x0);
dfx0=fpname(x0);
if abs(dfx0)>eps
    d=fx0/dfx0;
    x1=x0-d;
    fx1=fname(x1);
    it=1;
    xk(it)=x1;
    %fprintf('it=%d  x=%8.15f \n',it,x1);
else
    fprintf('Derivata nulla in x0 - EXIT \n')
    disp(dfx0)
    x1=[];
    xk=[];
    it=[];
    return
end

while it<nmax && abs(fx1)>=tolf && abs(d)>=tolx*abs(x1)
    x0=x1;
    fx0=fname(x0);
    dfx0=fpname(x0);
    if abs(dfx0)>eps
        d=fx0/dfx0;
        x1=x0-d;
        fx1=fname(x1);
        it=it+1;
        xk(it,:)=x1;
        %fprintf('it=%d  x=%8.15f \n',it,x1);
    else
        fprintf('Derivata nulla in xi - EXIT \n')
        disp(dfx0)
        break
    end
end
if it==nmax
    fprintf('raggiunto massimo numero di iterazioni \n');
end

