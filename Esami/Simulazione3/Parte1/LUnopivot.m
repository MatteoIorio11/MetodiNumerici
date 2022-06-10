function [L, U, flag] = LUnopivot(A)
flag = 0;
[n,m] = size(A);
if n~=m
    L = [];
    U = [];
    flag = 1;
    return
end
U = A;
for k=1:n-1
    if U(k, k) == 0
        L = [];
        U = [];
        flag  = 1;
        return
    end
    for i=k+1:n
        U(i, k) = U(i, k)/U(k,k);
        for j=k+1:n
            U(i, j) = U(i, j) - U(i, k)*U(k, j);
        end
    end
end
L = tril(U, -1) + eye(n);
U = triu(U);
end