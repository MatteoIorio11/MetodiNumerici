function [a] = metodoQR(A, b)
[Q, R] = qr(A);
h = Q'*b;
n = size(A, 2);
[a, f] = Usolve(R(1:n, 1:n), h(1:n));
end