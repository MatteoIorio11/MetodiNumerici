%A nxn simmetricxa e definita positiva 
%K2=massimo degli autovalori di A / minimo autovalore di A
clc
clear all
syms a
A=[3, 0, 1; 0, a, 0; 1, 0, 1];
autovalori=eig(A);
%AUTOVALORE MINIMO
%CASO 1 : a                 se 0<a<=2-sqrt(2)
%CASO 2 : 2-sqrt(2)         se 2-sqrt(2)< a <= 2+sqrt(2)
%CASO 3 : 2-sqrt(2)         se a > 2+sqrt(2)

%AUTOVALORE MASSIMO
%CASO 1 : 2+sqrt(2)         se 0<a<=2-sqrt(2)
%CASO 2 : 2+sqrt(2)         se 2-sqrt(2)< a <= 2+sqrt(2)
%CASO 3 : a                 se a > s+sqrt(2)

%K2 assume tre valori diversi
%CASO 1 : 2+sqrt(2)/a          se 0<a<=2-sqrt(2)
%CASO 2 : 2+sqrt(2)/2-sqrt(2)  se 2-sqrt(2)<a<2+sqrt(2)
%CASO 3 : a/2-sqrt(2)          se a > 2+sqrt(2)
x=linspace(0.01,9.99,100);
n=length(x);
y=zeros(n);
k2_p=zeros(1,n);
for i=1:length(x)
    C=[3, 0, 1; 0, x(i), 0; 1, 0, 1];
    k2_p(i)=cond(C);
    if(x(i) <= 2-sqrt(2))
        k2=(2+sqrt(2))/x(i);
    elseif(x(i) > 2+sqrt(2))
        k2=(x(i))/(2-sqrt(2));
    else
        k2=(2+sqrt(2))/(2-sqrt(2));
    end
    y(i)=k2;
end
figure(1);
plot(x, y,'k-');
figure(2);
plot(x,k2_p, 'm-');