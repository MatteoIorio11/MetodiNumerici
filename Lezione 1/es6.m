clc 
clear all
%f= NOME DELLA FUNCTION HANDLE
f1=@(X) X.^3-3*X;
f2=@(X) 3*X.*cos(2*X);
f3=@(X) sin(X)./X;

%decision=input('inserire un valore da 1 a 3 per sceglire il greafico -> ');
decision=menu('CHOSE A NUMBER' , '1','2','3', 'altro');
%oppure potrei fare parto da 0, ogni elemento è equispaziato di 0.1 fino
%all'elemento 1
%%map=0:0.1:1; == xx=linspace(-3,3, 80);
switch decision
    case 1
        xx=linspace(-3,3, 80);
        yy=f1(xx);
        plot(xx, yy, 'k:');
    case 2
        xx=linspace(0, 2*pi, 80);
        yy=f2(xx);
        plot(xx, yy, 'k:');
    case 3
        xx=linspace(-8*pi, 8*pi, 80);
        yy=f3(xx);
        plot(xx,yy,'k:');
    otherwise
        disp('NUMBER NOT VALID');
end