clc
clear all
close all
Funzione1=@(x) sin(pi/2^(x+1));
Funzione2=@(x) 2^(x+1);

pi_values=[];

TEMP=0;
for i=2:26
    pi_values(i)=b_values(i-1) * s_values(i-1);
    s_values(i)=sqrt((1-sqrt(1-s_values(i-1)^2))/2);
    b_values(i)=2*b_values(i-1);
end

ERRORE=abs(pi_values-pi)/(abs(pi));
semilogy(1:26,ERRORE);
hold on
%VERSIONE RAZIONALIZZATA
TEMP=0;
b=2;
s=1;
for i=1:26
    pi_values(i)= b * s
    s=((s)) / sqrt(2*(1+sqrt((1-s^2))));
    b=2*b;
end
ERRORE=abs(pi_values-pi)/(abs(pi));
semilogy(1:26,ERRORE);
