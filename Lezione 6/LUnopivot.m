function [L, U, Flag] = LUnopivot(A)
[n,m]=size(A);
if n ~= m
    disp('Matrice non quadrata');
    L=[];
    U=[];
    Flag=1;
end
U=A;
for k=1:1:n-1
    if (U(k,k) == 0)
        disp('elemento diagonale nullo');
        Flag=1;
        L=[];
        U=[];
        return
    end
    for i=k+1:1:n
        if A(k,k) ~= 0 
            m=A(i,k)/A(k,k);
            L(i,k)=m;
            for j=k+1:1:n
                A(i,j)=A(i,j)-m*A(k,j);
            end
        end
    end
end
Flag=0;
end

