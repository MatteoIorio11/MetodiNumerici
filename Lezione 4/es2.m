clc
clear all
%Un problema si dice MAL CONDIZONATO se a piccole perturbazioni sui dati
%corrispondono perturbazioni sui risultati, notevolemente piu grandi ( di un ordine di grandezza molto piu grande ),
%diveramente il problema si dice BEN CONDIZIONATO

%perturbazioni = ERRORI RELATIVI
%Se gli errori sono dello stesso grado di grandezza allora è ben
%condizionato, altrimenti non si riuscirà mai a trovare una soluzione
%corretta

%risoluzione di sistemi lineari :
%Se il mio problema consiste nel calcolare la soluzione X appartenente ad 
% R^n di un sistrema lineare Ax=b 
% A matrice quadrata n x n non singolare
% b vettore di R^n
%x=A \ b; -> SOLUZIONE ESATTA
%SCHEMA RISOLUTIVO:
%x sarà la soluzione esatta ottenuta dai dati esatti A e b
%---------- PERTURBAZIONI SUL TERMINE NOTO
%CASO 1 : supponiamo che la matrice A abbia rappresentazione esatta sul
%calcolatore (in F), supponiamo di considerare perturbazioni solo sul
%vettore b (b-)
%b dato esatto
%b- ====> b+y(vettore di perturbazioni), in questo modo ho il mio vettore b
%perturbato
%x-=A \ b- ==>x-= A \ (b+y) SOLUZIONE OTTENUTA DA DATI PERTURBATI
%----COME TROVARE L'ERRORE
%ERRORE RELATIVO SUI DATI = || b - (b-) || / ||b|| ---> usiamo norme vettoriali 
%ERRORE RELATIVO SUI RISULTATI = || x - (x-) || / ||x|| ----> usiamo sempre
%norme vettoriali (inf, 1, 2)
%-------- PERTURBAZIONI SULLA MATRICE A
%CASO 2 : supponiamo che il vettore b abbia rappresentazione esatta e sulla
%matrice A ci sia una perturbazione
%A- = A+y ==> Dato perturbato, y è una matrice di perturbazioni
%ERRORE RELATIVO SUI DATI = || A - (A-) || / || A || ------> usiamo norme
%matriciali (inf, 1, 2)
%x = A \ b SOLUZIONE ESATTA
%x- = A- \ b ---> x- = A+y \ b SOLUZIONE OTTENUTA DAI DATI PERTURBATI
%ERRORE RELATIVO SUI RISULTATI : || x - (x-) || / || x || ---> norme
%vettoriali in quanto x è un vettore

%Ax=b dove A hilbert di ordine 4 e b =[1,1,1,1]T
A=hilb(4);
b=[1,1,1,1]';
x=(A\b)
y=[1;-1;1;1];
b_t=(b+y*(0.01));
x_t=(A\b_t)
ERRORE_DATO=norm(b - b_t, 2)/(norm(b));
ERRORE_RISULTATO=norm(x - x_t, 2)/(norm(x));
disp(ERRORE_DATO);
disp(ERRORE_RISULTATO);
k2=cond(A) %ALTO IL NUMERO DI CONDIZIONAMENTO
%PROBLEMA MAL CONDIZIONATO IN QUANTO SE IL DATO E' PERTURBATO DEL 1% IL
%RISULTATO E' DEL 73%




