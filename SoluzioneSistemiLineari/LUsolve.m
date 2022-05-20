function [x, flag] = LUsolve(L, U, P, b)
[y, flag] = Usolve(U, P*b);
if flag == 0
    [x, flag] = Lsolve(L, y);
else
    x = [];
    return
end