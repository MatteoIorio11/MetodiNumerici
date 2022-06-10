function [yy] = InterpL(x, y, xx)
n = length(x);
for i=1:n
    p = plagr(x, i);
    Lk(i, :) = polyval(p, xx);
end
yy = y*Lk;
end