clc
clear all
close all
syms x
fx=exp(-x)-(x+1);
fx2=x^3+x^2-33*x+63;
deriv=diff(fx,x,1);
deri2=diff(fx2,x,1);
fun2=matlabFunction(fx2);
df2=matlabFunction(deri2);
fun=matlabFunction(fx);
df=matlabFunction(deriv);
a=-1;
b=2;
tolx=1.e-12;
tolf=1.e-12;
x0=-0.5;
alpha=0;
%METODO DI NEWTON FUNZIONE 1
%[RESULT, X_VALUES, ITERATION]=newtonFunction(fun,df, x0, tolx, tolf, 500)
%err=abs(RESULT-alpha);
%ORDINE=ortdine(X_VALUES, ITERATION)
z=linspace(-5,5,200);
figure
plot(z,fun2(z));
x0=1;
[RESULT, X_VALUES, ITERATION]=newtonFunctionMODIFICATO(fun2,df2,2, x0, tolx, tolf, 500);
RESULT
ordine=ortdine(X_VALUES, ITERATION)