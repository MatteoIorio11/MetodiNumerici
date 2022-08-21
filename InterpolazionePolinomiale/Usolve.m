function [y, flag] = Usolve(U, b)
[n, m] = size(U);
if n ~= m
    disp('Errore matrice non quadrata')
    y = [];
    flag = 1;
    return
end
% Test singolarita'
if all(diag(U)) ~= 1
	 disp('el. diag. nullo'), 
	x=[]; 
	flag=1; 
	return
 end
y = zeros(n);
for i=n:-1:1
    x(i) = (b(i) - U(i, i+1:n)*x(i+1:n))/U(i,i);
end
end
