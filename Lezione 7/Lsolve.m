function [x,flag] = Lsolve(L,b)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[n, m] = size(L);
flag = 0;
%test dimensione
if n~=m
    disp('Error');
    x=[];
    flag=1;
    return
end
%test singolarita
if all(diag(L)) ~= 1
    disp('elemento diagonale nullo');
    x=[];
    flag=1;
    return
end
 %Inizializzazione del vettore soluzione
x=zeros(n,1);
for i=1:n
    %i riga i-esima della matrice
    %L(i,1:i-1)*x(1:1-i)) => prodotto scalare riga iesima per il vettore X
    x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i);
end

end

