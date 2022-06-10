clc
clear all
close all

toll = 1.e-3;
xx = linspace(1, 8, 100);
xi = [1, 13/6, 10/3, 9/2, 17/3, 41/6, 8];
a=0;
b=pi;
it = 1;
val = 1;
for v=1:3:7
    val = 1;
    for i=1:7
        x = xi(i);
        fxv = @(t) cos(x*sin(t)-v*t);
        [IN, N] = traptoll(fxv, a, b, toll);
        [IE] = besselj(v, x);
        Err(it) = abs(IE - 1/pi * IN)/abs(IE);
        res(val) = 1/pi*IN;
        res2(val) = IE;
        it = it + 1;
        val = val + 1;
    end
    [yy] = interpL(xi, res, xx);
    figure()
    plot(xi, res, 'bo', xx, yy, 'k-', xx, besselj(v, xx), 'r-');
    title('Interpolazione dei valori')
    legend('Set di valori', 'Interpolazione', 'Besselj')
end

