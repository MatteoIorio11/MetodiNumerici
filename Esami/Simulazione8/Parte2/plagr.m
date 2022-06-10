function [p] = plagr(x, k)
if k==1
    xz = x(2:end);
else
    xz=[x(1:k-1) x(k+1:end)];
end
p = poly(xz);
p = p/polyval(p, x(k));
end