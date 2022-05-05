clc
clear all
format long e
f1 = @(x) (1-cos(x))/(x^2);
f2= @(x) (2*sin(x/2)^2)/(x^2);
f3= @(x) (sin(x)^2)/(x^(2)*(1+cos(x)));
for counter=2:2:12
    f1(10^(-(counter)))
    f2(10^(-counter))
end