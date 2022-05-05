clc
clear all
%disegnare 4 funzioni in [-pi _ pi]
%costruisco un vettore X il quale prende un certo numero di punti nel mio
%50 è il numero di punti che voglio creare
X=linspace(-pi, pi, 50);
%MOLTIPLICO IL MIO VETTORE PER I VARI SCALARI
Y1=sin((1/3)*X);
Y2=sin((1/2)*X);
Y3=sin(1*X);
Y4=sin(2*X);
%STAMPA DEI GRAFICI
figure(1);
%hold on IN CASO DI PIU CHIAMATE PLOT
%plot(X, Y1, 'b-',X, Y2, 'm-',X, Y3, 'c-',X, Y4, 'g-');
%plot(X, Y2, 'm-');
%plot(X, Y3, 'c-');
%plot(X, Y4, 'g-');
SCALARI=[1/3, 1/2, 1, 2];
Types=['b-', 'm-', 'c-', 'g-'];
for i=1:1:4
   k=SCALARI(i);
   plot(X, sin(k*X), Types(i));
end