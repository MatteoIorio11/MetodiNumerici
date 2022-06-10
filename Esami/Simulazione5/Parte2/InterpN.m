function [pval, a] = InterpN(x, y, xx)
[a] = diff_divise(x, y);
[pval] = pvalHornerN(a, x, xx);
end