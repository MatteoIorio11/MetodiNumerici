function [p] = build_handler(a, x)
syms z

a = diff_divise(a, x);
n = length(a);
ps = a(n);
for k=n-1:-1:1
    ps = ps*(z-x(k))+a(k);
end
p = matlabFunction(ps);