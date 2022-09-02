 function [x,flag]=LUsolve(L,U,P,b)
 % Risoluzione a partire da PA =LU assegnata
 Pb=P*b;
 [y,flag]=Lsolve(L,Pb);
 if flag == 0
     [x,flag]=Usolve(U,y);
 else
     return
 end
 
