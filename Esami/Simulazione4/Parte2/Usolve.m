function [x, flag] = Usolve(U, b)
[n, m] = size(U);
flag = 0;
if n~=m
    x = [];
    flag = 1;
end
if all(diag(U))~=1
    x=[];
    flag = 1;
end
x = zeros(n, 1);
for i=n:-1:1
    x(i)=(b(i) - U(i, i+1:n)*x(i+1:n))/U(i,i);
end

end