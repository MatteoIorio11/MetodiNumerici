function [x, fl] = Usolve(U, b)
[n, m] = size(U);
fl = 0;
if n~=m
    x=[];
    fl = 1;
    return
end
if all(diag(U))~=1
    x=[];
    fl = 1;
    return
end
x = zeros(n,1);
for i=n:-1:1
    x(i) = (b(i) - U(i, i+1:n)*x(i+1:n))/U(i,i);
end
end