function [a,condG,p]=metodoEN(A,b)
% input A = matrice m × n, m > n
% input b = vettore termine noto di m
% output a = vettore soluzione nel senso dei minimi quadrati del sistema lineare
% sovraderterminato Ax=b, ottenuto mediante  il metodo delle Equazioni
% Normali

% Risolvi il sistema delle equazioni normali A'*A a = A'b
G = A'*A;
z = A'*b;
%Costruzione matrice e termine noto
condG = cond(G);
%to do
%fattorizzazione di Choleski
%to do
[L, p] = chol(G, 'lower');
if (p > 0)
    disp('G non è definita positiva');
    a = G\z;
    p = 1;
    return
end
%Soluzione del sistema triangolare inferiore
%to do
[xx, flag] = Lsolve(L, b);
%Soluzione del sistema triangolare inferiore
[a, flag] = Usolve(L', xx);
% =============================================================================|
% a sono i coefficienti del polinomio, dopo dovrò chiamare pvalHorner!!!       |
% =============================================================================|
