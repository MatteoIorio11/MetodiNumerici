function [pval] = pvalHornerN(a, x, xx)
nval = length(xx);
n = length(x);
pval = zeros(nval, 1);
for i=1:nval
    pval(i) = a(n);
    for k=n-1:-1:1
        pval(i) = pval(i)*(xx(i) - x(k))+a(k);
    end
end
end