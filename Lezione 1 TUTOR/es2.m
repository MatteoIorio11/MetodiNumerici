clc
clear all
close all
format long
syms k
a=1;
b=@(k) 10^k;
c=1;
x2=zeros(1,8);
x2_good=zeros(1,8);
%ax^2+bx+c=0
%(-b ±√(b2 - 4ac))/2a
for k=1:1:8
    x1 = (-b(k) - sqrt(b(2*k)-4*(a*c)))/(2*a);
    x2(k) = (-b(k) + sqrt(b(2*k)-4*(a*c)))/(2*a)
    x2_good(k)=1/x1
end
hold on
set(gca, 'yscale', 'log');
semilogy(x2, 'b');
semilogy(x2_good, 'k-');