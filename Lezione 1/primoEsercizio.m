a=[1.2, 5.4, 6, 1.5, 9];
b=[5.2, pi, 1.2, 1.5, 2];
fig=uifigure;
lbl=uilabel(fig);
result=uilabel(fig);
lbl.Text='Result SQRT';
%CALCOLO DELLA RADICE QUADRATA DI A

result.Text=sqrt(a);
%CALCOLO DI E^(a/2)
disp('CALCOLO ESPONENZIALE e^a/2');
exp(a./2)
%CALCOLO IN C DEL VETTORE SOMMA TRA a E b
c=a+b
%MOLTIPLICARE OGNI ELEMENTO DI a CON OGNI ELEMENTO DI b
d=a.*b
%CREARE UN VETTORE DI VALORI TRA 0 E 30 CON PASSO 0.5
vector=0:0.5:30
%CREARE UN VETTORE DI 100 ELEMENTI EQUISPAZIATI TRA 1 E 2
vector1=linspace(1,2,100);
