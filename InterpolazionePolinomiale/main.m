clc
clear all
close all
n=input('Introduci il grado del polinomio: g=');
intervallo=[1,2] % input('Introduci l''intervallo [a,b]: ');
a=intervallo(1);
b=intervallo(2);

%ascisse punti di interpolazione
scelta_x=input('Scegli le ascisse dei punti di interpolazione \n 1. Equidistanti \n 2. Zeri Chebychev ');
switch scelta_x
    case 1
         x=linspace(a,b,n+1);
        
    case 2
         for i=1:n+1
             x(i)=(a+b)/2+(b-a)/2*cos((2*i-1)*pi/(2*(n+1)));
         end
    
    otherwise
        close all;
        return;
end

%punti di valutazione
xv=linspace(a,b,301);

%ordinate punti di interpolazione
scelta_y=input('Scelgli ordinate punti interpolazione \n 1. Combinazione seni \n 2. Sinh \n 3. Valore assoluto \n 4. Runge');
switch scelta_y
    case 1
         f1= @(z) sin(z)-2*sin(2*z);
         f=f1(xv);
         y=f1(x); 
         
    case 2
      
         f2=@(z) sinh(z);
         f=f2(xv);
         y=f2(x);      
         
    case 3
         f3=@(z) abs(z);
         f=f3(xv);
         y=f3(x);     
        
    case 4
         f4=@(z) 1./(1+z.^2);
         f=f4(xv);
         y=f4(x); 
         
    otherwise
        close all;
        return;
end


%interpolazione col metodo di Lagrange
yv = InterpL(x, y, xv);

         
figure(1)
plot(x,y,'r*',xv,yv,'b-',xv,f,'r-');
legend('Punti di interpolazione','Interpolante di Newton','Funzione test');


r=abs(f-yv);

figure(2);
plot(xv,r,'b-');
legend('Valore assoluto dell''errore di interpolazione');

disp('Norma infinito dell''errore di interpolazione: ')
norminf_r=max(r)

