clc
clear all
close all
syms a 

A=[1 -1 2;
   -1 6 1;
   2  1 a];
it = 1;
Ap=matlabFunction(A);
minVal = norm(Ap(6), 'inf');
minVal1 = norm(Ap(6), 1);
as = 6;
as1 = 6;
for alpha=linspace(6, 10, 100)
    norm1(it) = norm(Ap(alpha), 1);
    normInf(it) = norm(Ap(alpha), 'inf');
    if minVal > normInf(it)
        minVal = normInf(it);
        as = alpha;
    end
    if minVal1 > norm1(it)
        minVal1= norm1(it)
        as1 = alpha;
    end
    it = it + 1;
end

As=Ap(as);
if As' == As
    disp('SIMMETRICA');
    [n, m] = size(As);
    for i=1:n
        detA = det(As(1:i, 1:i));
        if detA <= 0
            disp('La matrice non è definita positiva');
        end
    end
    disp('AMMETTE LA FATTORIZZAZIONE');
else
    disp('Non  ammette fattorizzazione di CHOL');
end




