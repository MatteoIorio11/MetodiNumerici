clc
clear all
close all
syms z


x=[1900:10:2010];
y=[76, 92, 106, 123, 132, 151, 179, 203, 226, 249, 281, 305]';
xx = linspace(min(x), max(x), 100);
figure
hold on
plot(x, y, 'bo');
it = 1;
a1=0;
a2=0;
a3=0;
% for n=1:3
%     A = costruisci_vander(x, n+1);
%     [coef] = metodoQR(A, y);
%     [pval] = pvalHorner(coef, xx);
%     plot(xx, pval,'*--');
% %     Err = sum(abs(ps(x(1:12)) - y(1:12))^2);
%     a1=coef;
%     a2=coef;
%     a3=coef;
% end
A = costruisci_vander(x, 2);
[coef] = metodoQR(A, y);
[pval] = pvalHorner(coef, xx);
plot(xx, pval,'-');

%     Err = sum(abs(ps(x(1:12)) - y(1:12))^2);
a1=coef;
A = costruisci_vander(x, 3);
[coef] = metodoQR(A, y);
[pval] = pvalHorner(coef, xx);
plot(xx, pval,'-');
a2=coef;
A = costruisci_vander(x, 4);
[coef] = metodoQR(A, y);
[pval] = pvalHorner(coef, xx);
plot(xx, pval,'-');
a3=coef;
legend('Set di punti', 'Ordine 1', 'Ordine 2', 'Ordine 3')


E1 = 0;
E2 = 0;
E3 = 0;
ps = build_handler(coef, x);
for i=1:12
    E1 = E1 + (pvalHorner(a1, x(i)) - y(i))^2;
    E3 = E2 + (pvalHorner(a2, x(i)) - y(i))^2;
    E2 = E3 + (pvalHorner(a3, x(i)) - y(i))^2;
end
E1
E2
E3





