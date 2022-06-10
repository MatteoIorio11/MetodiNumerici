function [pval] = pvalHorner(a, xx)
nval = length(xx);
n = length(a);
pval = zeros(nval ,1);
for i=1:nval
    pval(i) = a(n);
    for k=n-1:-1:1
        pval(i) = pval(i)*(xx(k))+a(k);
    end
end
end