clc
clear all
close all

x=[-55:10:65];
y=[3.7 3.7 3.52 3.27 3.2 3.15 3.15 3.25 3.47 3.52 3.65 3.67 3.52];

xx = linspace(min(x), max(x), 100);
[yy] = InterpL(x, y, xx);

figure(1)
plot(x, y, 'bo', xx, yy, 'r-');

a = -pi;
b = pi;

% PARTE DUE DELL'ESERCIZIO
f = @(x) sin(x) - 2.*sin(2.*x);
xx = linspace(a, b, 100);
for n=1:1:5
    numb = n+1;
    xe = linspace(a, b, numb);
    xc = cos((2*[1:n+1] -1)*pi/(2*(n+1)));
    ye = f(xe);
    yc = f(xc);
    yy1 = InterpN(xe, ye, xx);
    yy2 = InterpN(xc, yc, xx);
    figure
    rx1 = abs(f(xx)' - yy1);
    rx2 = abs(f(xx)' - yy2);
    plot(xe, ye, 'bo', xx, yy1, 'k-', xc, yc, 'ro', xx, yy2, 'g-', xx, rx1, 'c-', xx, rx2, 'p-');
    z1(n) = norm(rx1, 'inf');
    z2(n) = norm(rx2, 'inf');
    %title('Grado del polinomio : ', num2str(n));
    %legend('Primo Set', 'Prima interpolazione', 'Secondo Set', 'Seconda Interpolazione');
end
table(z1', z2')

% Parte tre esercitazione


for n=



