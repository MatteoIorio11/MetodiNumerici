clc
clear all
close all
x = input('Scegli la funzione 1-2-3 : ');
% Selezione funzione
switch x
    case 1 
        fname = @(x) cos(x);
        a = 0;
        b = 2;
    case 2
        fname = @(x) x.*exp(x).*cos(x.^2);
        a = -2*pi;
        b = 0;
    case 3
        in = input('Scegli pha 1-2-3 : ');
        switch in
            case 1
                pha = 13/2;
            case 2 
                pha = 5/2;
            case 3
                pha = 1/2;
        end
        fname = @(x) (sin(x).^pha.*cos(x));
        a = 0;
        b = pi/2;
end
figure(1)
fplot(fname);
errori_t = zeros(6,1);
errori_s = zeros(6,1);
Nt = zeros(6, 1);
Ns = zeros(6, 1);
It = zeros(6, 1);
Is = zeros(6, 1);
xesatta = integral(fname, a, b);
it = 1;
for k=4:10
    tol = (1 * 10^-k);
    [It(it), Nt(it)] = traptoll(a, b, fname, tol);
    [Is(it), Ns(it)] = simptoll(a, b, fname, tol);
    errori_t(it) = abs(It(it) - xesatta)/abs(xesatta);
    errori_s(it) = abs(Is(it)- xesatta)/abs(xesatta);
    it = it + 1;
end
figure(2);
semilogy([4:10], errori_t, 'ro-');
legend('traptoll');
figure(3)
semilogy([4:10], errori_s, 'bo-');
legend('simtoll');
table(It, Nt, errori_t)
table(Is, Ns, errori_s)
