function [x, flag] = Lsolve(L, b)
[n, m] = size(L);
flag = 0;
if n~= m
    flag = 1;
    return;
end
if all(diag(L)) ~= 1
    flag = 1;
    return
end
x = zeros(n, 1);
for i=1:n
    x(i) = (b(i) - L(i, 1:i-1)*x(1:i-1))/L(i,i);
end