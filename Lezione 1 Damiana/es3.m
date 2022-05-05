clc
clear all
syms p q
p=10^5;
i=1:1:10;
q=10.^-i
funz=@(p,q) -p+sqrt(p^2.+q);
func=-p+sqrt(p^2.+q);
fp=@(p,q) 1./(2*sqrt(p^2+q));
K=abs(fp(p,q)./abs(q)./abs(funz(p,q)));
Q=q'
Cond=K'
sol=funz(p,q);
Sol=sol'
T=table(Q,Cond, Sol)