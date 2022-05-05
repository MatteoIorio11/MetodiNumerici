clc
clear all
%default format SHORT -> mette in evidenzia i decimali
format rat %visualizza una approssimazione attraverso frazioni
%ai minimi termini
%format long %mette 15 cifre dopo la virgola
x=2^52 %numero di macchina appartenente ad F
x+1
x+2
x+0.5
x+(1+0.5)
%x+1 è un numero macchina ? 
%Calcolo lo spacing, estremo destro -t 
%dx=2^(53)
%spacing=2^(53-t)== 1
spacing=2^(53 - 53); 
%x+1 dispari
%x+2 pari
%x+0.5 (la meta dello spacing) 
%x+1.5 (x+(1+meta spacing))
y=2^53; %è un numero di macchina appartenente ad F
