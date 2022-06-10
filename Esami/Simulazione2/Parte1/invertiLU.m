function [inversa] = invertiLU(L, U)
[n, m] = size(L);
I = eye(n);
for i=1:n
    [x, fl] = Lsolve(L, I(:, i));
    [y, fl] = Usolve(U, x);
    inversa(:, i) = y;
end
end