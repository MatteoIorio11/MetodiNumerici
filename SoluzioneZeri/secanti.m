function [x, nit] = secanti(fname, x0, xm1, tolx, tolf, NMAX)
%Implementazione del metodo delle secanti per il calcolo degli zeri in
%equazioni non lineari. (Fa parte dei metodi di linearizzazione.)
%A differenza del metodo delle corde non usa un valore di m costante (Usa quello dei due iterati precedenti).
%Convergenza superlineare sei valori iniziali si scelgono vicino alla
%soluzione -> CONVERGENZA LOCALE
m=(fname(x0)-fname(xm1))/(x0-xm1);
x1=x0-fname(x0)/m;
nit=1;
x(nit)=x1;
while nit <= NMAX && abs(m*fname(x0))>=tolx*abs(x1) && abs(fname(x1))>=tolf
	xm1=x0;
	x0=x1;
	fxm1=fname(xm1);
	fx0=fname(x0);
	m=(fx0-fxm1)/(x0-xm1);
	x1=x0-fx0/m;
	nit=nit+1;
	x(nit)=x1;
end
if nit==NMAX
fprintf('raggiunto massimo numero di iterazioni \n');
end
