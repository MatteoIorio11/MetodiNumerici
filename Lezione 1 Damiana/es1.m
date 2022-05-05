clc
clear all
syms a
%a e (0, 2/3]
A=[1, 1, 1; 0, a, a; a, 2*a, a];
A_1=[1, -1/a, 0; -1, 0, 1/a; 1, 1/a, -1/a];
x_values=linspace(0.01,2/3,100);
%CALCOLARE LA NORMA 1 DI A E A-1
min=2^54;
max=0;
a_best=0;
a_worst=0;
figure (1)
x_axis=linspace(0,1,100);
conditions_numbers=linspace(0,1,100);
for i=1:100
   A=[1,1,1; 0, x_values(i), x_values(i);x_values(i), 2*x_values(i),x_values(i)];
   disp("NORMA 1 A")
   VALUE_NORM_A=myNorm(A)
   A_1=[1, -1/x_values(i), 0; -1, 0, 1/x_values(i); 1, 1/x_values(i), -1/x_values(i)];
   disp("NORMA 1 A-1")
   VALUE_NORM_A_1=myNorm(A_1)
   %CALCOLARE IL NUMERO DI CONDIZIONAMENTO
   disp("NUMERO DI CONDIZIONAMENTO")
   K=VALUE_NORM_A_1 * VALUE_NORM_A
   conditions_numbers(i)=K;
   if (min > K)
       min=K;
       a_best=x_values(i);
   end
   if (max < K)
       max=K
       a_worst=x_values(i);
   end
   b=[-8, -1, 9]'
   x=linsolve(A,b)
   lambda=[0.01, 0.001, 0.001;0, 0.001, 0.001; 0, 0.001, 0.01];
   A_tilde=A+lambda;
   x_tilde=linsolve(A_tilde,b)
   ERRO_REL_dati=(norm(A_tilde,1))/(norm(A,1))
   ERRO_RES_sol=(norm(x - x_tilde, 1))/(norm(x,1))
end
plot(x_values, conditions_numbers, 'r-');

disp("MIGLIOR alpha E MIGLIOR CONDIZIONAMENTO .");
min
a_best
disp("PEGGIOR alpha E PEGGIOR CONDIZIONAMENTO .");
max
a_worst
norm(A,1)

%ESERCIZIO NUMERO F Ax=b

