function [x, flag] = Lsolve(L, b)
[n, m] = size(L);
if n ~= m
    disp('Errore matrice non quadrata.')
    x = [];
    flag = 1;
    return
end
if all(diag(L)) ~= 1
    disp('Errore')
    x = [];
    flag = 1;
end
x = zeros(n);
for i=1:1:n
    x(i) = (b(i) - L(i, 1:i-1)*x(1:i-1))/L(i,i);
end
end