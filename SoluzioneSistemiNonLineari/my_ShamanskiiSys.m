function [x1,Xm, it]= my_ShamanskiiSys(fun,jac,x0,tolx,tolf,nmax)
%
% Funzione per la risoluzione del sistema f(x)=0
% mediante il metodo di Shamanskii.
%
% INPUT:
%      fun, jac  nomi dei file contenenti rispettivamente 
%                il vettore di funzioni  non lineari e 
%                la matrice Jacobiano del vettore di funzioni non lineari
%         x0     vettore colonna contenente l'approssimazione iniziale della soluzione
%         tolx     parametro di tolleranza per l'errore tra due iterati
%         successivi
%           tolf: tolleranza sul valore della funzione
% OUTPUT:
%         x      vettore soluzione del sistema non lineare
%        Xm: vettore contenente l'errore relativo tra due soluzioni
%         successive
%       it     numero di iterazioni fatte per ottenere l'approssimazione  desiderata
%

matjac=jac(x0);
if det(matjac)==0
    disp('Errore nella derivata.')
    x=[];
    Xm=[];
    it=[];
    return
else
 %aggiornamento della soluzione
 it = 1;
 s = -matjac\fun(x0);
 x1 = x0+s;
 fx1=fun(x1);
end
Xm=[norm(s,1)/norm(x1,1)]
ogni=10;
while it <=nmax && norm(fx1, 1) >= tolf && norm(s, 1) >=tolx * norm(x1, 1)
   x0=x1;
   it=it+1;
  
   if rem(it,ogni)==0
        %Aggiorno la valutazione della matrice Jacobiano nell'iterato precedente
        %ogni 10 iterazioni
        matjac = jac(x0);
        if det(matjac)==0
             disp('Errore nella derivata prima')
             x1 = [];
             Xm = [];
             it = [];
            return
        else
         %Risolvo il sistema lineare aventa come matrice dei coefficienti la
         %matrice Jacobiana e come termine noto la Funzione vettoriale F valutata
         %in x0
             fx0 = fun(x0);
             s = -matjac\fx0;
        end
   else
         %non aggiorno la valutazione della matrice Jacobiano, mantengo la
         %stessa per 10 iterazioni
             fx0 = fun(x0);
             s = -matjac\fx0;
   end
    %aggiornamento della soluzione
    x1 = x0 + s; 
    fx1 = fun(x1);
    Xm=[Xm;norm(s,1)/norm(x1,1)];
 
end
if it==100
   disp('Il procedimento non converge con la ');
   disp('precisione desiderata.');
   disp('Dopo 100 passi'); 
   fprintf('\t\t norma = %f .',norm(x-x0,'inf'));
end

