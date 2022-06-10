function [IN] = trapcomp(fun, a, b, N)
h=(b-a)/N;
nodi = [a:h:b];
f = fun(nodi);
IN = (f(1) + 2*sum(f(2:N)) + f(N+1))*(h/2); 
end