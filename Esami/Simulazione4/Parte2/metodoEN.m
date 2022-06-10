function [a] = metodoEN(M, b)
[L, p] = chol(M, 'lower');
[x, f] = Lsolve(L, b);
[a, f] = Usolve(L', x);
end