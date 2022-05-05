clc
clear all
format long
x=0.3;
y=0.2;
z=0.1;
%floating di 0.3 e floating di 0.2 ottenendo il floating dell'operazione
%successivamente farò il floating di 0.1 e successiamente dovrò calcolare
%il floating del risultato finale

%all'interno della macchina 0.3 viene reappresentato non con 0.3 in maniera
%finita ma ttraverso una approssimazione : 0.01001100110011001101
ris=(x-y)-z
ris=x-(y+z)
ris=z*(y+0.5)
%sempre 5 floating 

ris=0.1*(0.2+0.5)
ris=0.1*0.2*+0.1+0.5