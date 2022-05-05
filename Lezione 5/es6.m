clc
clear all
format long e
%x e x+1 non hanno errore di approssimazione cio vuol dire che entrambi i
%valori hanno una rappresentazione esatta in F
%A(x) in aritmentica floating point, vuol dire che devo prevedere un
%floating ogni volta che eseguo un floating in ogni espressione di A(x)
esponenti=[1:1:20];
x=10.^esponenti;
Ax=1./x - (1./(x+1)); %Valore calcolato
Bx=1./(x.*(x+1)); %Valore esatto
err_relativo=abs(Ax - Bx)./(abs(Bx)); %errore calcolato da matlab
%stima teorica dell'errore relativo calcolato sulla carta
u=eps/2;
err_teorico=(abs(x+1) + abs(x) + 1)*u;
figure(1)
loglog(x,err_relativo, 'b-',x,err_teorico, 'r-');
legend('errore di matlab', 'stima teorica');