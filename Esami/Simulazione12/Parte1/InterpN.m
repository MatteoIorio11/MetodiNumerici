function [yy] = InterpN(x, y, xx)
a = diff_divise(x, y);
yy = pvalHornerN(a, x, xx);
end