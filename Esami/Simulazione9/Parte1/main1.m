clc
clear all
close all

a=0;
b=1;
toll =1.e-6;
Ies=zeros(30, 1);
y = app1();
z = app2();
for n=1:30
    In = @(x) (x.^n)./(x+10);
    [IN, N] = traptoll(In, a, b, toll);
    Ies(n) = IN;
    err1(n) = abs(Ies(n) - z(n)')/abs(Ies(n));
    err2(n) = abs(Ies(n) - y(n)')/abs(Ies(n));
end

figure(1)
semilogy(1:30, err1, 'r-')
title('Errore tra Ie e y')
figure(2)
semilogy(1:30, err2,'b-')
title('Errore tra Ie e z')


