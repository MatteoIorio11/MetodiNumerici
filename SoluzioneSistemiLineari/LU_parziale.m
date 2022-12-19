function [L,U,P,flag]=LU_parziale(A)

% Implementazione eplicitando i tre cicli in k (passo), i(riga), j
% (colonna) dell'algoritmo



% Fattorizzazione PA=LU con pivot parziale
% In output:
%  L matrice triangolare inferiore
%  U matrice triangolare superiore
%  P matrice di permutazione sulle righe
%    tali che  PA=LU
  
  % Test dimensione
  [n,m]=size(A);
  flag=0;
  if n ~= m, disp('errore: matrice non quadrata'),  L=[]; U=[]; P=[]; flag=1; return, end
  % Copia A in U  
  U=A; 
  P=eye(n);
  % Fattorizzazione
  for k=1:n-1
      %Scelta pivot parziale + scambi su U e P
      %Al passo k calcolo l'indice di riga (a partire da k) in cui si trova
      %l'elemento di modulo massimo della colonna k-esima
      [pivot,ir_pivot]=max(abs(U(k:n,k))); 
      ir_pivot=ir_pivot+(k-1); 
      if pivot == 0
          disp('pivot nullo')
          L=[];
          flag=1; 
          return
      end
      %Se l'indice di riga ir_pivot in cui si trova l'elemento di modulo massimo
      %della colonna k-esima e' diverso da k, facciamo lo scambio tra la
      %riga k-esima e la riga ir_pivot. Facciamo lo scambio anche sulle
      %corrispondenti righe della matrice identità per memorizzare gli
      %scambi effettuati
      if ir_pivot  ~= k
         temp=U(k,:); 
         U(k,:)=U(ir_pivot,:); 
         U(ir_pivot,:)=temp;
         temp=P(k,:); 
         P(k,:)=P(ir_pivot,:); 
         P(ir_pivot,:)=temp;
      end
      %Procediamo con l'eliminazione gaussiana classica
      %Eliminazione gaussiana
      for i=k+1:n
      U(i,k)=U(i,k)/U(k,k);                         % Memorizza il moltiplicatore della riga i-esima
         for j=k+1:n                %cicla sugli elementi della riga i, dalla posizione k+1 alla posizione n        
          U(i,j)=U(i,j)-U(i,k)*U(k,j);  % modifica l'elemento della riga i-esima in posizione j
         end
      end
  end

  
  L=tril(U,-1)+eye(n); % Estrae i moltiplicatori 
  U=triu(U);           % Estrae la parte triangolare superiore+diagonale
  
