clc
clear all
%-- SETTING FORMAT 
format long 
p=0;
t=53;
f=2^p; %numero di F
s=2^(p+1-t); %spacing su [2^p, 2^(p+1)]

f1=f+s %numero di macchina successivo ad f, non è 1

f2=f+(s/4)%viene approssimato con f in quanto piu vicino
f3=f+(s/2)%viene approssimato a 2^0 in quanto pari

f1-f %la distanza tra i due è la distanza di macchina