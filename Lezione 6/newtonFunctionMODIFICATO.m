
function [result, x_values,iterations] = newtonFunctionMODIFICATO(funct, deri,m, x0, tolx, tolf, NMAX)
%m=molteplicita radice, 2
fx0=funct(x0);
dfx0=deri(x0);
if(abs(dfx0) > eps) 
    d=fx0/dfx0;
    result=x0-m*d;
    iterations=1;
    fx1=funct(result);
    x_values(iterations)=result;
else
    result=[];
    x_values=[];
    iterations=[];
    error('Function s derivate must be positive')
end
while iterations <NMAX && abs(fx1) >= tolf && abs(d) >= tolx*abs(result)
    x0=result;
    fx0=funct(x0);  
    dfx0=deri(x0);
    if (abs(dfx0)>eps)
        d=fx0/dfx0;
        result=x0-m*d;
        fx1=funct(result);
        iterations=iterations+1;
        x_values(iterations)=result;
    else
        error('Function s derivate must be positive');
    end
end

