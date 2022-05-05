function [L, U, Flag] = LUnopivot(A)
[n,m]=size(A);
if n ~= m
    disp('Matrice non quadrata');
    L=[];
    U=[];
    Flag=1;
end
U=A;
for k=1:1:n-1
    if (U(k,k) == 0)
        disp('elemento diagonale nullo');
        Flag=1;
        L=[];
        U=[];
        return
    end
 %   for i=k+1:1:n
%        U(i,k)=U(i,k)/U(k,k);
%         for j=k+1:1:n
%             U(i,j)=U(i,j)-U(i,k)*U(k,j);
%         end
        U(k+1:n,k)=U(k+1:n,k)/U(k,k);
        U(k+1:n,k+1:n)=U(k+1:n,k+1:n)-U(k+1:n,k)*U(k,k+1:n);
 %   end
end
Flag=0;
L=tril(U,-1)+eye(n);%Escludo la diagonale principale
U=triu(U);
end

