function [inve] = solv_nsis(A, b)
[n, m] = size(b);
% Questa è la versione con LUpivot (LUparziale) nel caso in cui le L,U fossero già precalcolate basterà modificare questo codice andando a cambiare i 
% parametri di input -> solv_nsis(L, U, P(solo se viene utilizzato LUpivot), b);
% Sostituendo A con L ed U. Nel caso in cui si fosse utilizzato LUpivot ( quello con il massimo ) dovrai passare anche la matrice P. Nel caso in cui
% si usi Lunopivot basterà passare semplicemente b e si dovrà cambiare la riga in cui si richiama Lsolve in questo modo (:::)
[L, U, P, flag] = LUparziale(A);
for j=1:m
    [x, f] = Lsolve(L, P*b(:, j)); % (:::) -> [x, f] = Lsolve(L, b(:, j)); QUESTO QUANDO USI AL DI FUORI DI STO METODO LUnopivot
    [y, f] = Usolve(U,x);
    inve(:, j) = y;
end

end
