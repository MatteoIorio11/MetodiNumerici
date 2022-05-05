clc
clear all
%moltiplicazione -> errore relativo è costante, ciò rende l'operazione
%stabile, qualunque siano i dati da moltiplicare

%divisione -> errore relativo è costante, ciò rende l'operazione stabile,
%qualunque siano i dati da dividere

%somma algebrica -> errore relativo non costante, è una operazione non
%stabile, dipende fortemente dai dati di input (x, y)
% se X o Y non appartiene ad F e x+y tende a 0 allora questi coefficienti
% nei denominatori esplodono ( cancellazzione numerica ).
format long
a=1.234567890123400e+15;
b=-1.234567890123401e+15;
c=0.06;
%devo evitare di sommare numeri con esponenti troppo diversi, altrimenti il
%numero piu piccolo viene assorbito dal numero piu grande
ris=(a+b)+c;
fprintf("risultato (a+b)+c : %d\n", ris);
%il numero C viene inglobato in a e b in quanto estremamente molto piu
%grandi, provocando di conseguenza un errore molto importante 
%a+c = a -> in quanto c è estremamente piccolo
ris=(a+c)+b;
fprintf("risultato (a+c)+b : %d\n", ris);
%b+c = b -> in quanto c è estremamente piccolo 
ris=a+(b+c);
fprintf("risultato a+(b+c) : %d\n", ris);
%perdendo addirittura l'elemento neutro della somma algebrica
%-- CAMBIO VARIABILI --%
a=0.23371258e-4;
b=0.33678429e+2;
c=-0.333677911e+2;
disp("%--CAMBIO DELLE VARIABILI--%");
ris=(a+b)+c;
fprintf("risultato (a+b)+c : %10.30f\n", ris);
ris=(a+c)+b;
fprintf("risultato (a+c)+b : %10.30f\n", ris);
ris=a+(b+c);
fprintf("risultato a+(b+c) : %10.30f\n", ris)
%l'utlimo valore è quello corretto in quanto b e c hanno lo stesso
%esponente andando a perdere meno informazioni possibili