clc
clear all
close all
fun=@(x) x.^3-8;
% equazione1=@(x) [2*x(1)-cos(x(2));sin(x(1))+2*x(2)];
% equazione2=@(x) [2*x(1)-cos(x(2));sin(x(1))+2*x(2)];
% equazione3=@(x) [2*x(1)-cos(x(2));sin(x(1))+2*x(2)];
% 
NMAX=500;
tolx =1e-10;
tolf =1e-10;
% jacob1 = @(x) [2 sin(x(2)); cos(x(1)) 2];
% jacob2 = @(x) 1;
% 
% xx=[-4:0.5:4];
% yy=[-4:0.5:4];
% 
% [X,Y]=meshgrid(xx,yy);
% Z1=2*X - cos(Y);
% Z2=sin(X) + 2*Y;
% 
% figure 
% mesh(X,Y,Z1);
% hold on
% contour(X,Y,Z1, [0 0], 'r-', 'linewidth', 2);
% 
% figure 
% mesh(X,Y,Z2);
% hold on
% contour(X,Y,Z2, [0 0], 'r-', 'linewidth', 2);
% 
% figure
% contour(X,Y,Z1, [0 0], 'r-', 'linewidth', 2);
% hold on
% contour(X,Y,Z2, [0 0], 'g-', 'linewidth', 2);
% x0=[-1;2];
% 
% %[x1New,XmNew,itNew]=newtonFunSys(equazione1, jacob1, x0, tolx, tolf, NMAX);
% 
% % plot3(result(1), result(2), sistema([result(1), result(2)]), 'ro');
% % figure
% % semilogy(1:iterations, Error, 'r-o');
% 
% [x1Cor,XmCor,itCor] = corde(equazione1, jacob1, x0, tolx, tolf, NMAX);
% %plot3(x1Cor(1), x1Cor(2), equazione1([x1Cor(1), x1Cor(2)]), 'ro');
% [x1Sha,XmSha,itSha] = shamanskii(equazione1, jacob1, x0, tolx, tolf, NMAX)
% plot3(x1Sha(1), x1Sha(2), equazione1([x1Sha(1), x1Sha(2)]), 'ro');
% figure
% semilogy(1:itSha, XmSha, 'b-o', 1:itCor, XmCor, 'r-o');
figure
fpname = @(x) 3*x.^2;
xx=-5:0.1:5;
% plot(xx,fun(xx))
% hold on
% plot(xx,fpname(xx),'g')
x0=-1;
a=-4;
b=4;
xm=a-0.5;
m = (fun(b) - fun(a))/(b-a);
[x1New,xkNew,itNew]=newton(fun,fpname,x0,tolx,tolf,500);
[x1Regu,xkRegu,itRegu]=regula_falsi(fun,a,b,tolx,500);
[x1Bis,xkBis,itBis]=bisez(fun,a,b,tolx);
[x1Sec,xkSec,itSec]=secanti(fun,xm, x0,tolx, tolf, 500);
[x1Cor,xkCor,itCor]=cordeF(fun,m, -1,tolx, tolf,500);



alpha = 2;
ek_bisez=abs(xkBis-alpha);
ek_corde=abs(xkCor-alpha);
ek_secanti=abs(xkSec-alpha);
ek_newton=abs(xkNew-alpha);
semilogy(1:itBis,ek_bisez,'go-',...
          1:itCor,ek_corde,'bo-',...
          1:itSec,ek_secanti,'co-',...
          1:itNew,ek_newton,'ro-')

