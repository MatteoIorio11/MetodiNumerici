clc
clear all
figure (1)
F1 = @(x) exp(-x)-(x+1);
fplot(F1, [-1,2]);
hold on
plot(linspace(-1,2), zeros(100))
[NIT, X_K, X_VALUES]=bisezione(F1, -1, 2, 1.e-12);
%plot(X_VALUES, 0, 'ro');
alpha=0;
erroBis=abs(X_K-alpha)
semilogy([1, NIT], erroBis, 'ro');