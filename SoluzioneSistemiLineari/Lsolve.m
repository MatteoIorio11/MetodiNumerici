 function [x,flag]=Lsolve(L,b)
 % Risoluzione con procedura forward di Lx=b con L triangolare inferiore  
 % flag=0 se il sistema e' risolubile
 % flag=1 se il sistema non soddisfa le ipotesi di applicabiltà: matrice
 % non quadrata, o e' nullo almeno un elemento sulla diagonale della
 % matrice
 % Test dimensione
 [n,m]=size(L); 
 flag=0;
 if n ~= m
	disp('errore: matrice non quadrata'), 
	x=[];
	flag=1; 
	return
 end
 % Test singolarita'
 if all(diag(L)) ~= 1
	 disp('el. diag. nullo'), 
	x=[]; 
	flag=1; 
	return
 end

 % Preallocazione vettore soluzione
 x=zeros(n,1);
 % Risoluzione forward
 for i=1:n
      x(i)= (b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i);
 end
 