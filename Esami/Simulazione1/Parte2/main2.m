clc
clear all
close all
syms x

p=10^5;

fun1 = @(x) -p + sqrt(p^2 + x);
fun2 = @(x) x/(p + sqrt(p^2 + x));
deri1 = @(x) 1/(2*(x + 10000000000)^(1/2));
deri2 = @(x) 1/((x + 10000000000)^(1/2) + 100000) - x/(2*(x + 10000000000)^(1/2)*((x + 10000000000)^(1/2) + 100000)^2);

it = 1;
for i=0:10
    qi = 10^(-i);
    values(it) = qi;
    cond1(it) = (abs(qi)*abs(deri1(qi)))/(fun1(qi));
    cond2(it) = (abs(qi)*abs(deri2(qi)))/(fun2(qi));
    res1(it) = fun1(qi);
    res2(it) = fun2(qi);
    it = it + 1;
end
disp('determinati valori si annullano dopo che i >= 7, SOFFRE DI CANCELLAZIONE NUMERICA ')
table(values', cond1', res1', cond2', res2')



