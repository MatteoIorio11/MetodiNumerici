function [fl] = checkLU(A)
[n,m] = size(A);
fl = 0;
if n ~= m
    disp('Non è quadrata');
    fl = 1;
    return
end
for i=1:n-1
    if rank(A(1:i,1:i)) ~= i
        disp('Errore')
        fl = 1;
        return
    end
end
if all(detA~=0)
    disp('Matrice A ammette fattorizzazione di Gauss senza pivoting')
    return
end
fl = 1;
end