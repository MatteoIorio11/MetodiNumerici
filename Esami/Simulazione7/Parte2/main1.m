clc
clear all
close all

a=-2;
b=2;
toll =1e-6;
fx1 = @(x) x.^3-1;
fx2 = @(x) x.^3-2*x.^2+1;
figure(1)
fplot(fx1);
figure(2)
fplot(fx2);


[I1, N1] = simptoll(fx1, a, b, toll);
[I2, N2] = simptoll(fx2, a, b, toll);
table(I1,N1, I2, N2)
[I1, N1] = traptoll(fx1, a, b, toll);
[I2, N2] = traptoll(fx2, a, b, toll);
table(I1,N1, I2, N2)









