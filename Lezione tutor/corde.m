function [x1,Xm,it] = corde(fun, jac, x0, tolx, tolf, nmax)
matjac=jac(x0);
if det(matjac)==0
       disp('la matrice dello Jacobiano calcolata nell''iterato precedente non è a rango massimo')
       x1=[] ;
       Xm=[];
       it=[];
       return
else
s=-matjac\fun(x0);
%aggiornamento della soluzione
it=1;
x1=x0+s;
fx1=fun(x1);
end
Xm=[norm(s,1)/norm(x1,1)];
while it<=nmax && norm(fx1,1)>=tolf && norm(s,1)>=tolx*norm(x1,1)  
   x0=x1;
   it=it+1;
   %Risolvo il sistema lineare aventa come matrice dei coefficienti la
   %matrice Jacobiana e come termine noto la Funzione vettoriale F valutata
   %in x0
    s=matjac\fun(x0);
    %aggiornamento della soluzione
    x1=x0-s;
    fx1=norm(fx1,1);
    Xm=[Xm;norm(s,1)/norm(x1,1)];
end
 




if it==nmax
   disp('Il procedimento non converge con la ');
   disp('precisione desiderata.');
   disp('Dopo 100 passi'); 
   fprintf('\t\t norma = %f .',norm(x-x0,'inf'));
end
end

