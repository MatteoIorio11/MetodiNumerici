function [pval] = pvalHornerN(a, x, xx)
n = length(x);
nval = length(xx);
pval = zeros(nval, 1);
for i=1:nval
    pval(i)=a(n);
    for k=n-1:-1:1
        pval(i) = pval(i)*(xx(i) - x(k)) + a(k);
    end
end
end