function [p] = plagr(xnodi, k)
if k==2
    xzeri = xnodi(2:end);
else
    xzeri = [xnodi(1:k-1) xnodi(k+1:end)];
end
p = poly(xzeri);
p = p/polyval(p, xnodi(k));
end