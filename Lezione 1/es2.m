clc
clear all
A=magic(4);%Matrice 4 x 4 di numeri interi
B=[0, 1, 0, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 0, 1,0];
%Calcolo di BxA e AxB 

%La matrice B viene chiamata matrice di permutazione 
A
%METTO COME PRIMA RIGA LA SECONDA, COME SECONDA RIGA LA QUARTA, COME TERZA
%RIGA LA PRIMA E COME QUARTA RIGA LA QUARTA
B*A %mi permette di scambiare le righe se viene moltipliata a sinistra

A*B %mi permette di scambiare le colonne se viene moltiplicata a destra