function [L, U, P, s, fl] = LUpivot(A)
[n, m] = size(A);
s=0;
fl = 0;
if n~=m
    disp('Non quadrata');
    L = [];
    U = [];
    P =[];
    fl = 1;
    s=[];
    return
end
U = A;
P = eye(n);
for k=1:n-1
     [maxV, r] = max(abs(U(k:n, k)));
     r = r + (k-1);
    if maxV == 0
        disp(k)
        disp('Errore elemento diagonale nullo');
        L = [];
        U = [];
        P = [];
        fl = 1;
        s = [];
        return;
    end
     if r ~=k
         tmp = U(r, :);
         U(r, :) = U(k, :);
         U(k, :) = tmp;
         tmp = P(r, :);
         P(r, :) = P(k, :);
         P(k, :) = tmp;
         s = s +1;
      end
     U(k+1:n, k) = U(k+1:n, k)/U(k,k);
     U(k+1:n, k+1:n) = U(k+1:n, k+1:n) - U(k+1:n, k)*U(k, k+1:n);

end
L = tril(U, -1) + eye(n);
U = triu(U);
end