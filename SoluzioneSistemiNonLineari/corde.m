function [x1, Xm, it] = corde(fun, jac, x0, tolx, tolf, nmax)

matjac=jac(x0);
%Utilizzo per tuttol 'algoritmo la valutazione della matrice Jacobiano
%nell'iterato iniziale
if det(matjac)==0
    disp('Errore, la derivata in x0 è nulla.');  
    x1=[];
    Xm=[];
    it=[];
    return
else

%aggiornamento della soluzione
it=1;
s = -matjac\fun(x0);
x1 = x0+s;
fx1=fun(x1);
end
Xm=[norm(s,1)/norm(x1,1)]
while it <= nmax && norm(fx1, 1) >= tolf && norm(s, 1) >= tolx*norm(x1, 1)
    x0=x1;
    it=it+1;
    %Risolvo il sistema lineare aventa come matrice dei coefficienti la
    %matrice Jacobiana non aggiornata ed uguale a quella calcolata
    %nell'iterato inziale e come termine noto la Funzione vettoriale F valutata
    %in x0
    fx0 = fun(x0);
    s = -matjac\fx0;
    %aggiornamento della soluzione
    x1 = x0+s;
    fx1 = fun(x1);
    Xm=[Xm;norm(s,1)/norm(x1,1)];
end

if it==100
   disp('Il procedimento non converge con la ');
   disp('precisione desiderata.');
   disp('Dopo 100 passi'); 
   fprintf('\t\t norma = %f .',norm(x-x0,'inf'));
end