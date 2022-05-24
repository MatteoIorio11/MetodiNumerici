clc
clear all
close all
x = input('Scegli la funzione 1-2-3 : ');
switch x
    case 1 
        fname= @(x) x.^10;
    case 2
        fname = @(x) log(x+1);
    case 3
        fname = @(x) asin(x);
end
errori_t = zeros(8,1);
errori_s = zeros(8,1);
xesatto_1 = integral(fname, 0, 1);
figure(1)
fplot(fname);
for k = 1:1:8
    N = 2^k;
    n(k) = N;
    [It] = trapcomp(fname, 0, 1, n(k));
    [Is] = simpcomp(fname, 0, 1, n(k));
    errori_t(k) = abs(xesatto_1 - It)/abs(xesatto_1);
    errori_s(k) = abs(xesatto_1 - Is)/abs(xesatto_1);
end
figure(2)
semilogy(n, errori_t, 'ro-', n, errori_s, 'bo-');
legend('trapcomp', 'simpcomp');
