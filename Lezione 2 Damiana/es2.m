clc
clear all
F1=@(x) exp(-x)-(x+1);
F2=@(x) log2(x+3)-2;
F3=@(x) sqrt(x) - (x^2)/4;
%REGULA FALSI DI FUNZIONE 1
[NIT, OUTPUT, VALUES]=falsi(F1, -1, 2, 1.e-12, 1.e-12, 1000);
figure(1)
hold on
fplot(F1, [-1,2], 'k');
MaxIteration=NIT
Xk=OUTPUT
totalValues=VALUES;
ERRORE=abs(Xk - 0);
semilogy([1, MaxIteration], ERRORE, 'ro');
%REGULA FALSI DI FUNZIONE 2
[NIT, OUTPUT, VALUES]=falsi(F2, -1, 2, 1.e-12, 1.e-12, 1000);
figure(2)
hold on
fplot(F2, [-1,2], 'r');
MaxIteration=NIT
Xk=OUTPUT
totalValues=VALUES;
ERRORE=abs(Xk - 1);
semilogy([1, MaxIteration], ERRORE, 'ro');
%REGULA FALSI DI FUNZIONE 3 
[NIT, OUTPUT, VALUES]=falsi(F3, 1, 3, 1.e-12, 1.e-12, 1000);
figure(3)
hold on
fplot(F2, [1,3], 'b');
MaxIteration=NIT
Xk=OUTPUT
totalValues=VALUES;
ERRORE=abs(Xk - 2^4/3);
semilogy([1, MaxIteration], ERRORE, 'ro');

