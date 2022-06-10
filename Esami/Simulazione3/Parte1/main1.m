clc
clear all
close all

A = [10 -4 4 0;
    -4 10 0 2;
    4 0 10 2
    0 2 2 0];
B = [5 -2 2 0;
    -2 5 0 1;
    2 0 5 1;
    0 1 1 5];
norma1(A)
norm(A,'inf')
[aut] = eig(A);
norm(A,2)
max(aut)
[f] = check_chol(A);
if f == 1
    disp('A non puo subire CHOL');
end
[f] = check_chol(B);
if f == 1
    disp('B non puo subire CHOL');
end
[f] = check_LU(A);
if f == 1
    disp('A non puo subire LU');
end
[f] = check_LU(B);
if f == 1
    disp('B non puo subire LU');
end

disp('Calcolo determinante di A : ')

[L, U, flag] = LUnopivot(A);
[n, m] = size(U);
val = 1;
detA = det(A);%Tramite funzione
for i=1:n
    val = val * U(i,i);
end
detA = val % VALORE CALCOLATO
detAinv = 1/val %VALORE DETERMINANTE M INVERSA

[L, U, flag] = LUnopivot(B);
[n, m] = size(U);
val = 1
detB = det(B);%Tramite funzione
for i=1:n
    val = val * U(i,i);
end
detB = val % VALORE CALCOLATO
detBinv = 1/val %VALORE DETERMINANTE M INVERSA
