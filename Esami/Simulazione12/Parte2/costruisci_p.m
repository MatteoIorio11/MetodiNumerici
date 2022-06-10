function [p] = costruisci_p(x, y)
% x : punti noti
% y : valori noti ( y=fx(x))
syms z
a = diff_divise(x, y);
n = length(a);
ps = a(n);
for i=n-1:-1:1
    ps = ps*(z-x(i)) + a(i);
end
p = matlabFunction(ps);
end