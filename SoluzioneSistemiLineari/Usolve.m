  function [x,flag]=Usolve(U,b)
 % Risoluzione con procedura forward di Ux=b con U triangolare superiore
  % flag=0 se il sistema e' risolubile
 % flag=1 se il sistema non soddisfa le ipotesi di applicabiltà: matrice
 % non quadrata, o e' nullo almeno un elemento sulla diagonale della
 % matrice
 % Test dimensione
 [n,m]=size(U); 
 flag=0;
 if n ~= m
	disp('errore: matrice non quadrata'), 
	x=[];
	flag=1; 
	return
 end
 % Test singolarita'
 if all(diag(U)) ~= 1
	 disp('el. diag. nullo'), 
	x=[]; 
	flag=1; 
	return
 end

 % Preallocazione vettore soluzione
 x=zeros(n,1);
 % Risoluzione backward
 for i=n:-1:1
    x(i)= (b(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
 end
 