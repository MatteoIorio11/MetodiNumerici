clc
close all
clear all


scegli_sistema=input('1. sistema 1 \n 2. sistema 2 \n  3. sistema 3  \n 4. sistema 4 \n 5. sistema 5 \n')
if scegli_sistema==1
    f=@(x,y)[2*x(1)-cos(x(2)); sin(x(1))+2*x(2)];   
    jac=@(x)[2  sin(x(2));
             cos(x(1)) 2];
    xm=[-4:0.5:4];
    ym=[-4:0.5:4];
    [X,Y]=meshgrid(xm,ym);
    Z=2*X-cos(Y);
    Z1=sin(X)+2*Y;

    

 elseif scegli_sistema==2
    f=@(x)[x(1)+x(2)-3; x(1).^2+x(2).^2-9];   
    jac=@(x)[1  1;
            2*x(1) 2*x(2)];

    xm=[-4:0.5:4];
    ym=[-4:0.5:4];
    [X,Y]=meshgrid(xm,ym);
    Z=X+Y-3;
    Z1=X.^2+Y.^2-9;
    
    
 

elseif scegli_sistema==3
    f=@(x)[x(1).^2+x(2).^2-2; exp(x(1)-1)+x(2).^3-2];   
    jac=@(x)[2*x(1)  2*x(2);
             exp(x(1)-1) 3*x(2)^2];
    
    xm=[-2:0.25:2];
    ym=[-2:0.25:2];
    [X,Y]=meshgrid(xm,ym);
    Z=X.^2+Y.^2-2;
    Z1=exp(X-1)+Y.^3-2;

 elseif scegli_sistema==4
     f=@(x) [4*x(1).^2+x(2).^2-4; 
            x(1)+x(2)-sin(x(1)-x(2))];
     jac=@(x) [8*x(1) 2*x(2);
            1-cos(x(1)-x(2)) 1+cos(x(1)-x(2))];
        %Iterato iniziale ok [-1;1]
     
    xm=[-2:0.25:2];
    ym=[-2:0.25:2];
    [X,Y]=meshgrid(xm,ym);
    Z=4*X.^2+Y.^2-4;
    Z1=X+Y-sin(X-Y);

    elseif scegli_sistema==5
     f=@(x) [x(1)^2+x(2)^2-2*x(1)-2*x(2)+1; 
            x(1)+x(2)-2*x(1)*x(2)];
     jac=@(x) [2*x(1)-2  2*x(2)-2;
            1-2*x(2) 1-2*x(1)];
        %Iterato iniziale ok [-1;1]
     
    xm=[-5:0.25:5];
    ym=[-5:0.25:5];
    [X,Y]=meshgrid(xm,ym);
    Z=X.^2+Y.^2-2*X-2*Y+1;
    Z1=X+Y-2*X*Y;

 
end

figure
mesh(X,Y,Z);
hold on
contour(X,Y,Z,[0 0],'r-','linewidth',2);
figure
mesh(X,Y,Z1);
hold on
contour(X,Y,Z1,[0 0],'k-','linewidth',2);
    
figure
contour(X,Y,Z,[0 0],'r-','linewidth',2);
hold on
contour(X,Y,Z1,[0 0],'g-','linewidth',2);
axis('equal')

x0=[1; 1];
nmax=500;
[xN,XmN,contN]= my_newtonSys(f,jac,x0,1e-10,1e-10,nmax);
[xC,XmC,contC]= corde(f,jac,x0,10^-10,1e-10,nmax);
[xS,XmS,contS]= my_ShamanskiiSys(f,jac,x0,10^-10,1e-10,nmax);

hold on
plot3(xN(1),xN(2),f([xN(1),xN(2)]),'ro')


fprintf('Metodo di Newton ---> Iterato iniziale [%10.5e; %10.5e] --->Iterazioni %5i --> Zero [%10.5e; %10.5e] \n',x0,contN,xN)
fprintf('Metodo delle corde ---> Iterato iniziale [%10.5e; %10.5e] --->Iterazioni %5i --> Zero [%10.5e; %10.5e] \n',x0,contC,xC)
fprintf('Metodo di Shamanskii ---> Iterato iniziale [%10.5e; %10.5e] --->Iterazioni %5i --> Zero [%10.5e; %10.5e] \n',x0,contS,xS)


figure
semilogy(1:contN,XmN,'ro-',1:contC,XmC,'go-',1:contS,XmS,'bo-')
legend('Newton','Corde','Shamanskii')