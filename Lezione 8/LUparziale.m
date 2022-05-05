function [L,U,P, Flag] = LUparziale(A)
[n,m]=size(A);
if n ~= m
    disp('Matrice non quadrata');
    L=[];
    U=[];
    Flag=1;
end
U=A;
P=eye(n);
for k=1:1:n-1
   [massimo, r_max]=max(abs(U(k:n,k))); % trovo il massimo della colonna, passandole la sottomatrice Ak,k
   r_max=r_max+(k-1);%Siccome prendo la sottomatrice devo rendere globale l'indice della riga, andandole a sommare k-1
   if massimo==0
       disp('Valore nullo');
       Flag=1;
       L=[];
       U=[];
       return
   end
   if (r_max~= k)
        %Scambio riga k della matrice U con riga r_max
        temp=U(k,:);%Memorizzo riga k-esima
        U(k,:)=U(r_max,:);
        U(r_max, :)=temp;
        %Scambio riga k della matrice P con riga r_max
        temp=P(k,:);%Memorizzo riga k-esima
        P(k,:)=P(r_max,:);
        P(r_max, :)=temp;
   end
   for i=k+1:1:n   
        U(i,k)=U(i,k)/U(k,k);
         for j=k+1:1:n
             U(i,j)=U(i,j)-U(i,k)*U(k,j);
         end
    end
end
Flag=0;
L=tril(U,-1)+eye(n);%Escludo la diagonale principale
U=triu(U);
end

