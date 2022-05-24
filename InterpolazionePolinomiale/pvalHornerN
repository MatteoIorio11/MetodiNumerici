function [pval] = pvalHornerN(a, x, xv)
% valutazione del polinomo di Newton con coeficienti a ( ottenuti tramite
% le differenze divise ) in un vettore di punti xv
%xv : vettore di punti
% HORNER : valutazione di un polinomio in un punto, molto stabile e
% veloce.
% for i=2:-1:0
%     p=p*x+a(i)
% a calcolato con le diffrenze divise

n = length(a);
nval=length(xv);
pval=zeros(nval, 1);
for i=1:nval
    pval(i)=a(n);
    for k=n-1:-1:1
        pval(i)=pval(i)*(xv(i)-x(k))+a(k);
    end
end
end
