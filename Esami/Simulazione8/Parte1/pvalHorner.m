function [pval] = pvalHorner(a, xx)
n = length(a);
nval = length(xx);
pval = zeros(nval, 1);
for i=1:nval
    pval(i) = a(n);
    for k=n-1:-1:1
        pval(i) = pval(i)*xx(i) +a(k);
    end
end