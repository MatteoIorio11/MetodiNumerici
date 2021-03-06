function [a] = metodoQR(A,y)
% input A = matrice m × n, m > n
% input y = vettore termine noto di m
% output a = vettore soluzione nel senso dei minimi quadrati del sistema lineare
% sovraderterminato Ax=b, ottenuto mediante  il metodo QRLS
%Calcola la fattorizzazione QR di A e risolvi il sistema lineare con
%matrice triangolare superiore R(1:n,1:n) e termine noto h=Q'*y;
[Q, R] = qr(A);
h = Q'*y;
[a, flag] = Usolve(R, h);

% =============================================================================|
% a sono i coefficienti del polinomio, dopo dovrò chiamare pvalHorner!!!       |
% =============================================================================|

