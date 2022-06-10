function [pol, a] = interpN(x, y, xx)
[a] = diff_divise(x, y);
[pol] = pvalHornerN(a, x, xx);
end