clc
clear all
A=[3, 5; 3.01, 5.01];
b=[10,1]';
x=A\b
y=[0,0;0.1,0];
A_p=A+(y);
x_p=A_p\b
ERRORE_DATO=norm(A-A_p)/norm(A);
ERRO_P=ERRORE_DATO*100;
ERRORE_RISULTATO=norm(x-x_p)/norm(x);
E=ERRORE_RISULTATO*100;
k2=cond(A);

%--SECONDO CASO
A=[5, 10; 2, 1];
b=[15,1]';
x=A\b