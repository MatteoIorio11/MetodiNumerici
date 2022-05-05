function [X] = inverter(A,B)
[L, U, O, flag] = LUparziale(A);
[n,m] = size(A);
if flag == 0
    for i=1:m
        for i=1:n
            Y(:,i)=Lsolve(L, P*B(:,i));
            X(:,i)=Usolve(U, Y(:,i));
        end
    end
end
end

