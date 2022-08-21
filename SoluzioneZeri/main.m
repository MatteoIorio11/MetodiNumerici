clc
clear all 
%Definisco le funzioni in termini di varibile simbolica x per poter
%effettuare calcoli analatiici, tipo la derivata prima

syms x

scegli_funzione=input('1. Funzione 1 \n 2. FUnzione 2 \n 3. Funzione 3 \n');

    switch  scegli_funzione
        case 1
            fx=exp(-x)-(x+1); 
            alpha=0; 
            a=-1; 
            b=2; 
            x0=-0.5; 
            xm1=-0.3;
            
        case 2
            fx=log2(x+3)-2; alpha=1; a=-1; b=2; x0=-0.5; xm1=0.5;
            
        case 3
            fx=sqrt(x)-x^2/4; alpha=2^(4/3); a=1; b=3;  x0=1.8; xm1=1.5; 
    end
    
            
%Trasformo le funzioni nella variabile simbolica in forma utilizzabile con
%i calcoli numerici, facendo uso della funzione matlabFunction

f=matlabFunction(fx);
df=matlabFunction(diff(fx,x,1));
figure
plot(linspace(a,b,100),f(linspace(a,b,100)))
hold on
plot(linspace(a,b,100),zeros(100,1))
%..................................

tolx=1.e-12;
tolf=1.e-12;
nmax=1000;

%disp('.....BISEZIONE.....')
[xbisez,xk_bisez,it_bisez]=bisezione(f,a,b,tolx); 

figure
% 
% disp('.....FALSI.....')
 [xfalsi,xk_falsi,it_falsi]=regula_falsi(f,a,b,tolx,nmax);
% disp('.....CORDE.....') 
%Coefficiente angolare della retta nel caso di corde
m=(f(b)-f(a))/(b-a);
 [xcorde,xk_corde,it_corde]=corde(f,m,x0,tolx,tolf,nmax);
% disp('.....SECANTI.....') 
 [xsecanti,xk_secanti,it_secanti]=secanti(f,xm1,x0,tolx,tolf,nmax);
%disp('.....NEWTON.....') 
[xnewton,xk_newton,it_newton]=newton(f,df,x0,tolx,tolf,nmax);
 disp('..........................')
 disp(' ')
% 
it_corde
size(xk_corde,2)
ek_bisez=abs(xk_bisez-alpha);
ek_falsi=abs(xk_falsi-alpha);
ek_corde=abs(xk_corde-alpha);
ek_secanti=abs(xk_secanti-alpha);
ek_newton=abs(xk_newton-alpha);
%  
semilogy(1:it_bisez,ek_bisez,'go-',...
          1:it_falsi,ek_falsi,'mo-',...
          1:it_corde,ek_corde,'bo-',...
          1:it_secanti,ek_secanti,'co-',...
          1:it_newton,ek_newton,'ro-')
%  
 legend('bisezione','falsi','corde','secanti','newton')
% 
% %%%%%%%%%%% stima dell'ordine di convergenza %%%%%%%%%%%
 ordinebisez=stimaOrdine(xk_bisez,it_bisez)
 ordinefalsi=stimaOrdine(xk_falsi,it_falsi)
 ordinecorde=stimaOrdine(xk_corde,it_corde)
 ordinenewton=stimaOrdine(xk_newton,it_newton)
 ordinesecanti=stimaOrdine(xk_secanti,it_secanti)
 
% 
