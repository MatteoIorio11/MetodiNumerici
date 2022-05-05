function [result, Error, x_values,iterations] = newtonFunctionSys(funct, jacob, x0, tolx, tolf, NMAX)
fx0=funct(x0);
matJac=jacob(x0);
%determinante della matrice matJac == 0 non posso eseguire il mio
%algoritmo.
if(det(matJac) == 0) 
    result=[];
    x_values=[];
    iterations=[];
    error('Errore nel rango della matrice')
else
    s=-matJac\fx0;
    result=x0+s;
    iterations=1;
    fx1=funct(result);
    x_values(iterations, :)=result;
end
Error=[norm(s,1)];
%uso norm siccome fx1 è un vettore e non piu uno scalare
while iterations <NMAX && norm(fx1,1) >= tolf && norm(s,1) >= tolx*norm(result,1)
    x0=result; %x0 soluzione precedente
    fx0=funct(x0);  
    matJac=jacob(x0);%jacobiano in x0
    if(det(matJac) == 0) 
        error('Errore nel rango della matrice')
    else
        s=-matJac\fx0;%calcolo la soluzione, calcolo l'incremento, dato dalla soluzione della matrice jacobiana e della soluzione precedente
        result=x0+s;%calcolo il nuovo risultato
        fx1=funct(result);
        iterations=iterations+1;
       %per calcolare l'errore basta fare la norma di S.
        Error=[Error;norm(s,1)];
        x_values(iterations, :)=result;
    end
end

