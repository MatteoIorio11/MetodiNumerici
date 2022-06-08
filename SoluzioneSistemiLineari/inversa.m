function [inve] = inversa(L, U, b)
% Ricordo che b è la matrice identità -> b=eye(n)
% Nel caso in cui si fosse usato LUpivot, bisogna moltiplicare b per la matrice P -> inversa(L, U, P*b);
[n, m] = size(L);
for i=1:n
  [x, f] = Lsolve(L, b(:, i));
  [y, f] = Usolve(U, x);
  inve(:, i) = y;
end
