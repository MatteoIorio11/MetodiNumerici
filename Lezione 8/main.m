clc
clear all
close all
% A1=[1,2,3;4,0,2;1,6,2];
% b1=[6;6;9];
% A2=[2,1,3,4;1,0,3,4;1,5,0,6;2,1,3,0];
% b2=[10;8;12;6];
%La soluzione per avere tutti uno deve essere il risultato della somma dei
%valori della riga
% n=3;
% xesatta=ones(n,1);
% [L, U, Flag]=LUnopivot(A1);
% P=eye(n);
% [xc, flag]=LUsolve(L,U, P, b1);
% 
% n2=size(A2,1);
% xesatta=ones(n2,1);
% [L, U, Flag]=LUnopivot(A2);
% P=eye(n2);
% [xc, flag]=LUsolve(L,U, P, b2);

A=[1,2,3; 0,0,1;1,3,5];
b=[6;1;9];
n=size(A,1);
xesatta=ones(n,1);
[L,U,Flag]=LUnopivot(A);
if Flag == 0
    P=eye(n2);
    [xc, flag]=LUsolve(L,U, P, b)
end
[L,U,P,Flag]=LUparziale(A);
if Flag == 0
    [xc, flag]=LUsolve(L,U, P, b)
end

