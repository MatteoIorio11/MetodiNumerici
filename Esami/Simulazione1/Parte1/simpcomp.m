function [I] = simpcomp(fun, a, b, n)
h = (b-a)/(2*n);
nodi = [a:h:b];
f = fun(nodi);
I = (f(1) + 4*sum(f(2:2:2*n+1)) + 2*sum(f(3:2:2*n-1)) + f(2*n+1)) * (h/3);
end