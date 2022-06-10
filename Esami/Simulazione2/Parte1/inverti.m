function [inversa] = inverti(A)
[n, m] = size(A);
inversa = zeros(m, n);
for i=0:3
    inversa = inversa + A.^i;
end
end