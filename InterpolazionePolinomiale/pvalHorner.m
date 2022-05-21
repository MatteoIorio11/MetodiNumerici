  function pval = pvalHorner(a,xv)
% Valutazione di un polinomio con lo schema di Horner
% Input
%    c:   vettore contenente i coefficienti del polinomio da valutare
%    z:   vettore delle ascisse in cui valutare il polinomio
%
% Output
% pval:   vettore che contiene la valutazione del polinomio in ogni
%          componente del vettore z.
% 

n = length(a); 
nval=length(xv);
pval=zeros(nval,1);
for i=1:nval
pval(i) = a(n);
  for k=n-1:-1:1
        pval(i) = pval(i) * xv(k) + a(k);
  end
end
