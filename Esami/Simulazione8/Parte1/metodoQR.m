function [a] = metodoQR(A, b)
n = size(A, 2);
[Q, R] = qr(A);
h = Q'*b;
[a, fl] = Usolve(R(1:n, 1:n), h(1:n));
end