function [x,flag] = Usolve(U,b)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[n, m] = size(U);
flag = 0;
%test dimensione
if n~=m
    disp('Error');
    x=[];
    flag=1;
    return
end

%test singolarita
if all(diag(U)) ~= 1
    disp('elemento diagonale nullo');
    x=[];
    flag=1;
    return
end
 %Inizializzazione del vettore soluzione
x=zeros(n,1);
for i=n:-1:1
    %i riga i-esima della matrice
    %L(i,1:i-1)*x(1:1-i)) => prodotto scalare riga iesima per il vettore X
    x(i)=(b(i)-L(i,i+1:n)*x(i+1:n))/U(i,i);
    inv(U)
end

end

