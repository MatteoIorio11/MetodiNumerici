function [p] = plagr(x, k)
if k==1
    z = x(2:end);
else
    z = [x(1:k-1) x(k+1:end)];
end
p = poly(z);
p = p/polyval(p, x(k));
end