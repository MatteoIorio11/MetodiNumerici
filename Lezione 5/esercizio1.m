clc
clear all
%Prima fonte di errore : 
%1) Lavorare con un arrotondamento dei dati in quanto questi vengono
%arrotondati all'interno della nostra macchina, lavorando con
%approssimazioni, X~ => Da luogo all'ERRORE INERENTE, confronta il
%risultato esatto del problema con il risultato lavorando con il dato
%approssimato X~.

%2) Dovuta al fatto che le operazioni del nostro algoritmo, dobbiamo
%prevedere un errore di approssimazione dovuta allo svolgimento delle
%operazioni aritmetiche che costituiscono il nostro algoritmo risolutivo
%questa si vede quando si studia l'errore algoritmico, si assume gia che i
%dati sono numeri di macchina.

%a~, b~ 
%      ErrTOTALE = ErrInerente + ErrAlgoritmico
%a e b gia appartenenti ad F, voglio svolgere sulla macchina : 
%a^2-b^2 RISULTATO ESATTO
%Floating(a^2) = a^2(1+E1) -> |E1| < u
%Floating(b^2) = b^2(1+E2) -> |E2| < u
%Floating(Floating(a^2) -Floating(b^2)) -> RISULTATO MACCHINA
%Floating(a^2(1+E1) - b^2(1+E2))
%(a^2(1+E1) - b^2(1+E2))(1+E3)
%a^2(1+E1)(1+E3) - b^2(1+E2)(1+E3) -> E di grado 2 o piu non li conto 
%(a^2)(1+E1+E3) - b^2(1+E2+E3) 
%(a^2 - b^2)+a^2E1-b^2E2+(a^2-b^2)(E3)
%ErrAlgoritmico= (a^2 - b^2)+a^2E1-b^2E2 + (a^2-b^2)(E3) - (a^2-b^"))/(a^2 - b^2)
%<= a^2/(a^2-b^2) |E1| + b^2/(a^2-b^2) |E2| + (a^2-b^2)/(a^2-b^2) |E3|
%<= (a^2/(a^2-b^2) +b^2/(a^2-b^2) + 1)u 
%INDICE ALGORITMICO : (a^2/(a^2-b^2) +b^2/(a^2-b^2) + 1

%SE PER CALCOLARE a^2-b^2 UTILIZZO : (a+b)(a-b)
%Floating(Floating(a+b)*Floating(a-b))
%QUALI VALORI DI a E b ALGORITMO 2 E' PIU STABILE DI ALGORIMTO 1 


%Ialgoritmo2 <= Ialgoritmo1
%3<= a^2/(a^2/(a^2-b^2) +b^2/(a^2-b^2)+1

%F(10,5,L,U) a,b apparterranno a questa F
%a e b soddisfano la condizione 1/3<= (a^2/b^2) <=3
format long e
a=0.1e+1;
b=0.14125e+1;
%%%%%VALORE ESATTO DI a^2-b^2
result=a^2 - b^2%-9.951562500000002e-01
%%%%%SIMULO ESECUZIONE ALGORITMO 1 IN F(10,5,L,U)
a2=vpa(a^2,5);%Floating di F(a^2) = 1
b2=vpa(b^2, 5);%Floating di F(b^2) = 1.9952
%fprintf("Floating of a^2 and b^2 : %d %d\n",a2, b2);
result=vpa(1-1.9952,5) %-0.9952
%SECONDO ALGORITMO RISOLUTIVO
apb=vpa(a+b,5)%2.4125
amb=vpa(a-b,5)%-0.4125
result=vpa(apb*amb,5)%-0.99516

%QUALE RISULTATO E' PIU ACCURATO
%1) ERRORE RELATIVO 
err_rel1=abs(-0.9952 + 9.951562500000002e-01)/abs(-9.951562500000002e-01)
err_rel2=abs(-0.99516 + 9.951562500000002e-01)/abs(-9.951562500000002e-01)
%ERROE 2 PIU PICCOLO -> PIU ACCURATO IN QUANTO E' PIU PICOLO L'ERRORE CON
%ORDINE DI 10^-6




