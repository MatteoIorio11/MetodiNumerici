clc
clear all
close all

A = [1 2 4 0 0;
    2 6 0 0 0;
    4 0 3 1 0;
    0 0 1 -1/45 5;
    0 0 0 5 1];
norm(A, 2)
max(eig(A))
% Spiegare se A ammette LUnopivot
[flag] = checkLU(A);
if flag == 0
    disp('Ammette LUnopivot');
else
    disp('Non ammette Lunopivot');
end
[L, U, P, s, fl] = LUpivot(A);

%Calcolo del determinante

detA = (-1)^s *prod(diag(U));
det(A);

v = rand(5, 1);
[x, flag] = Usolve(U, v);
if flag == 0
    [r, flag] = Lsolve(L, x);
    val = (v'*r +1)*detA
    det(A+v*v')
end




