function [a] = diff_divise(x, y)
a = y;
n = length(x);
for i=1:n
    for k=n-1:-1:i
        a(k+1) = (a(k+1) - a(k))/(x(k+1)-x(k+1-i));
    end
end