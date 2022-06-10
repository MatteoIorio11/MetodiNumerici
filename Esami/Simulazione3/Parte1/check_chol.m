function [flag] = check_chol(A)
flag = 0;
if A~=A'
    disp('La matrice non è simmetrica');
    flag = 1;
    return
end
[n,m] = size(A);
for i=1:n
    detA = det(A(1:i, 1:i));
    if detA <= 0
        disp('Matrice non definita positiva');
        flag = 1;
        return
    end
end
end