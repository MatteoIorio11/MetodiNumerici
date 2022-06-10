clc
clear all
close all
syms a

A = [8, 4, 0, 0;
     4, 4, a, -1;
     0, a, 0.5*(a+2)^2, a+1;
     0, -1, a+1, a+1];
B =  [8, 4, 0, 0;
     4, 4, a, -1;
     0, a, 0.5*(a+2)^2, a+1;
     0, -1, a+1, 2];

[n, m] = size(A);
% Non tutti i valori sono maggiori stretti di 0, A non è definita positiva.
for i=1:n
    detA = det(A(1:i, 1:i));
end
% Tutti i valori sono maggiori stretti di 0, B è definita positiva. per i
% valori : 8, 16, 32a + 32, - 36*a^2] -> -sqrt(32)/6<a<sqrt(32)/6
for i=1:n
    detB = det(B(1:i, 1:i));
end

as = 1/4;
M = matlabFunction(B);
A = M(as);
if A == A'
    disp('Simmetrica')
end
b=[4, -1, -2, -3]';
[a] = metodoEN(A, b);

for i=1:n
    detM = det(A(1:i, 1:i));
    if detM == 0
        disp('Non applicabile');
    end
end
disp('LUnopivot è applicabile');
[L, p] = chol(A, 'lower');
det(A)
detM = prod(diag(L))^2









