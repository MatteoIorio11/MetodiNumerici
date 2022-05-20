function p=plagr(xnodi,k)
%Restituisce i coefficienti del k-esimo pol di
%Lagrange associato ai punti del vettore xnodi
if k==1
   xzeri=xnodi(2:end);
else
   xzeri=[xnodi(1:k-1) xnodi(k+1:end)];
end

%calcola i coefficienti del polinomio di grado n che si annulla nei punti
%del vettore xzeri e vale 1 nel nodo xnodi(k)
p = poly(xzeri);
p = p/polyval(p, xnodi(k));
