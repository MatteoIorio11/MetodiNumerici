clc
clear all
A=[6, 63, 662.2; 63, 662.2, 6967.8;662.2, 6967.8, 73393.5664];
b=[1.1, 2.33, 1.7]';
y=[1, 0, 0; 0, 0, 0; 0, 0 , 0];
x=A\b
A_perturbato=A+(y*0.01);
x_perturbato=A_perturbato\b
ERRORE_DATO=norm(A-A_perturbato)/norm(A,2);
ERRORE_RISULTATO=norm(x-x_perturbato)/norm(x,2);
fprintf("ERRORE DATO : %d\n", ERRORE_DATO);
fprintf("ERRORE RISULTATO : %d\n", ERRORE_RISULTATO);

k2=cond(A)