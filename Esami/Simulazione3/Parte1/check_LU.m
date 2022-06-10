function [flag] = check_LU(A)
[n,m] = size(A);
flag = 0;
for i=1:n
    detA = det(A(1:i, 1:i));
    if detA == 0
        disp('Non definita positiva');
        flag = 1;
        return
    end
end
end