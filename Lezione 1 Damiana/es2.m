clc
clear all
syms a
Z=[11+a, 10+a, 14+a; 12+a, 11+a, -13+a; 14+a, 13+a, -66+a];
a_values=linspace(30, 1000,1000);
Z_inversa=[-55*a-557, 83*a+843, -28*a-284; 55*a+610, -83*a-992, 28*a+311; 2, -3, 1];
K_values=linspace(30, 1000,1000);
figure (1)
for i=1:1000
    Z=[11+a_values(i), 10+a_values(i), 14+a_values(i); 12+a_values(i), 11+a_values(i), -13+a_values(i); 14+a_values(i), 13+a_values(i), -66+a_values(i)];
    disp("NORM INF Z");
    norm_infinito_Z=normInf(Z)
    Z_inversa=[-55*a_values(i)-557, 83*a_values(i)+843, -28*a_values(i)-284; 55*a_values(i)+610, -83*a_values(i)-992, 28*a_values(i)+311; 2, -3, 1];
    disp("NORM INF Z-1");
    norm_infinito_Z_1=normInf(Z)
    disp("NUMERO DI CONDIZIONAMENTO");
    K=norm_infinito_Z*norm_infinito_Z_1
    K_values(i)=K;
end
plot(a_values, K_values,'r-');
%seconda parte
delta=[10^-3, 10^-4, 10^-5, 10^-6];
b=[3*30 + 35, 3*30+10, 3*30-39]';
x_esatta=[1,1,1]';
for i=1:size(delta,2)
    Z_tilde=Z+[delta(i), 0, 0; 0, 0, 0; 0, 0, 0];
    x_tilde=linsolve(Z_tilde, b)
    ERRORE_RELATIVO_SOLUZIONE=norm(x_tilde-x_esatta, inf)/norm(x_esatta, inf)
end
