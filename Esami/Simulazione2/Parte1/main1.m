clc
clear all
close all

B = [   0.98 0.02 0 0.04 0;
        0.08 0.93 0.08 -0.07 -0.03;
        0.04 0.01 0.97 -0.07 -0.04;
        0.02 -0.03 0 1.03 0;
        0.07 0.04 0 -0.08 1.01
    ];
[n, m] = size(B);
I = eye(n);
A = I - B;
[m, r] = max(max(A));
% CALCOLO APPROSSIMAZIONE INVERSA 
[inversa1] = inverti(A);
% CONTROLLO DI B 
for i=1:n
    detB = det(B(1:i, 1:i));
    if detB == 0
        disp('B non puo subire LU senza pivoting');
        return
    end
end
disp('B può subire LUnopivot');
[L, U, flag] = LUnopivot(B);
if flag == 1
    disp('Errore');
end
[inversa2] = invertiLU(L, U);
inversaEsatta = inv(B);
err1 = norm(inversaEsatta - inversa1, 1)/norm(inversaEsatta, 1)
err2 = norm(inversaEsatta - inversa2, 1)/norm(inversaEsatta, 1)




