function yy = InterpL(x, y, xx)
%
%funzione che determina in un insieme di punti il valore del polinomio
%interpolante ottenuto dalla formula di Lagrange.
% DATI INPUT
%  x  vettore con i nodi dell'interpolazione
%  y  vettore con i valori dei nodi 
%  xx vettore con i punti in cui si vuole calcolare il polinomio
% DATI OUTPUT
%  y vettore contenente i valori assunti dal polinomio interpolante
%

n=length(x);
for k=1:n
    p = plagr(x, k);
    Lk(k, :) = polyval(p, xx);
    %calcola i coefficienti del k-esimo polinomio di Lagrange e denota con
    %Lk la sua valutazione nei punti xx 
    %SECONDO MODO
    %Lk=polyval(p, xx);
    %yy = yy + y(K)*Lk;
end
yy = y * Lk;
