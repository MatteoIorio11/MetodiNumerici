function [yy] = interpL(x, y, xx)
n = length(x);
yy = 0;
for i=1:n
    p = plagr(x, i);
    Lk = polyval(p, xx);
    yy = yy + Lk*y(i);
end
