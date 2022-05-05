function [x, flag] = LUsolve(L,U, P, b)
Pb=P*b;
[y,flag]=Lsolve(L, Pb);
if (flag == 0)
    [x,flag]=Usolve(U,y);
else
    disp('Metodo non applicabile')
    x=[];
    flag=1;
end
end

