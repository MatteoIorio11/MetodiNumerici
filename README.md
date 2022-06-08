# MetodiNumerici

<h3> indice di condizionamento </h3>
  
dove f = @(x) x^2 + x^3 ......;

```  
K = ( |x| * |f'(x)| ) / |f(x)|
```

indice di condizionamento <Matrice>

```
  A = zeros(n, n)

  % La norma dell'inversa di A * la norma della matrice A

  K = norm(A^-1,2)*norm(A, 2);
```

  Se K >> 1 il problema è mal condizionato

  ------------

  <h3> Come capire se un'operazione è stabile : </h3> 

  ```
  x = 10^-5 + sqrt((10^5)^2 - 0.00000000000000000000000000000000000000000000000000000000000000001)
  ```
  
  -> Vedrai che questa operazione avrà come risultato 0, vuol dire che questa formula soffre della CANCELLAZIONE NUMERICA.
  
  In generale per vedere se è stabile basta vedere se per un qualche valore il tuo risultato è 0
  
  ```
  a*x^2 + b*x + c = 0
  
  x1*x2=c / a
  
  ```
  
  --------------
  
  <h3> NORMA DUE UNITARIA : </h3>
  
  ```
 
 V = [....]
  
 x = norm(V, 2)
  
 V = V / x;
  
 ```
  
  
  -------------
  
  <h3> Quando applicare newton modificato </h3>

  ```
  syms x
  fx = x^2 + 2;
  dfx = diff(fx, 1, x);
  val = solve(fx);
  valD = solve(dfx);
  
  Nel caso in cui val e valD fossero uguali, dovrò utilizzare newton modifcato con M = 2 poiche sia la funzione che la derivata si annullano in 'val'
  PS : nel caso in cui la derivata prima non fosse 0, è buona norma continuare ad iterare questo processo per vedere se anche le altre derivate di fx si annullano, 
  per ogni valDi-esimo = solve(dfxi-esima) = val, M verrà incrementato.
  
  ```
  
  
 -------------
  
  <h3> Calcolo delle norme </h3> 
  
  
 * norma 1 = MASSIMO DEL VALORE ASSOLUTO DELLA SOMMA SULLE COLONNE
  
 * norma 2 = sqrt(p(A^T * A)) -> MASSIMO DEGLI AUTOVALORI IN VALORE ASSOLUTO 
  ```
  %CALCOLO NORMA 2  NEI VETTORI 
  
  n = sqrt(x' * x)
  
  
  % CALCOLO NORMA NELLE MATRICI
  -> [autovalori] = eig(A)
      norma2 = max(autovalori)
  
    % OPPURE 
    % [n, m] = size(A)
    % I=eye(n)
  -> autovalori => 
      %   [ (A - a*I)=0 ] devo risolvere questo problema, i risultati di 'a' saranno i miei autovalori.
    
  ```
  * norma infinito = MASSIMO DEL VALORE ASSOLUTO DELLA SOMMA SULLE RIGHE

-----------------
  <h3> Quando è possibile applicare LUsolve : </h3>
  
  Il determinante di tutte le sottomatrici deve essere != 0 per applicare l'algoritmo LUnopivot o LUpivot 
  
  ```
  [n, m] = size(A)
  for i=1:n
    detA(i) = det((A(1:i, 1:i));
    if detA(i) == 0
        disp('Non si può applicare')
        flag = 1
        return
    end
  end
                           
                           
%OPPURE
  for i=1:n
    detA(i) = det((A(1:i, 1:i));
  end
  if all(detA)~=0
    disp('Matrice A ammette fattorizzazione di Gauss senza pivoting')
  end

```

-----------------
<h3> Quando è possibile applicare Cholewsky in una matrice PARAMETRICA: </h3>

Bisogna controllare se tutti i valori del determinante di tale matrice parametrica sono maggiori stretti di 0, successivamente bisognerà verificare che 
per i valori per cui il determinante è maggiore di 0 la matrice sia anche simmetrica

```
  A = [8, 4, 0, 0;
     4, 4, a, -1;
     0, a, 0.5*(a+2)^2, a+1;
     0, -1, a+1, a+1];
B =  [8, 4, 0, 0;
     4, 4, a, -1;
     0, a, 0.5*(a+2)^2, a+1;
     0, -1, a+1, 2];

[n, m] = size(A);
%I determinanti delle sottomatrici principali di A sono:
%[8, 16, 32*a + 32, -4*a^2]
%Poichè -4a^2 non è mai positivo, non esiste alcun valore di a per cui la
%matrice A possa essere definita positiva( minori principali >0)
for i=1:n
    detA = det(A(1:i, 1:i));
end
%I determinanti delle sottomatrici principali di B sono:
%[8, 16, 32*a + 32, 32 - 36*a^2]
%Si verifica che per -sqrt(32)/6<a<sqrt(32)/6 la matrice B è definita
%positiva ( minori principali >0)
%Quindi il valore astar=1/2 rientra in questo range di valori
for i=1:n
    detB = det(B(1:i, 1:i));
end
astar=1/2;
Bs=matlabFunction(B);
A=Bs(astar)
if A == A'
    disp('A è simmetrica')
end
  
```
  
-----------------

  <h3> Quando è possibile applicare Cholewsky: </h3>
  
  Una matrice A ammette Cholewsky quando è simmetrica ed è definita positiva : 
  
  ```
  %PRIMO CONTROLLO
  if(A==A')
    disp('Matrice simmetrica')
  end
  %SECONDO CONTROLLO 
  for i=1:n
    if det(A(1:i, 1:i)) <= 0
        disp('Non si può applicare')
        flag = 1
        return
    end
  end
  ```
  
  ---------------------------------
 
 <h3> Calcolo della costante di Lebesgue per il grado n del polinomio </h3> 
 
 Indice di condizionamento di un polinomio interpolatore
 
 ```
    %Calcolo la somma dei valori assoluti delle n+1 funzioni base di
    %lagrange di grado n, valutati nei punti xx (sia nel caso in cui i nodi
    %siano equidistanti
    for l=1:n+1        
        pe=plagr(xe,l);
        Le=Le+abs(polyval(pe,xx));
    end
    %La costante di Lebesgue è il massimo della somma dei valori assoluti delle n+1 funzioni base di
    %lagrange di grado n, valutati nei punti xx
    LLe(i)=max(Le);
```

----------------------------
 <h3> Calcolo del determinante tramite fattorizzazione LUnopivot</h3>
 
 
  ![aaa](https://user-images.githubusercontent.com/70414065/172485072-b748b2ab-73bd-4c4b-8526-1908e45c02f7.png)

 
 
 ```
 [L, U, flag] = LUnopivot(A);
 detA = 1
 for i=1:n
    detA = detA * U(i,i)
  end
  
  % OPPURE
  detA = prod(diag(U))

 ```
 
 Determinante della matrice inversa 
 
  ```
 [L, U, flag] = LUnopivot(A);
 detA = 1
 for i=1:n
    detA = detA * U(i,i)
  end
  
  detInvA = 1/detA;  
  % OPPURE
  detA = prod(diag(U))
  detInvA = 1/detA
 ```
 
 ----------------------------
 <h3> Calcolo del determinante tramite fattorizzazione LUpivot</h3>
 
 In questo caso all'interno dell'algoritmo vi potrebber essere degli spostamenti di valori. L' esponente 's' rappresenta il numero di spostamenti che sono stati effettuati sulle righe.
 
 
 
  ```
 [L, U, ,P, flag] = LUpivot(A);
 detA = 1
 for i=1:n
    detA = detA * U(i,i)
  end
  detA = ((-1)^s)*detA;
  
  % OPPURE
  detA = ((-1)^s)*prod(diag(U))


 ```
 
 Determinante della matrice inversa 
 
 
 ```
 [L, U, ,P, flag] = LUpivot(A);
 detA = 1
 for i=1:n
    detA = detA * U(i,i)
  end
  detA = ((-1)^s)*detA;
  
  detInvA = 1/detA;
  
  % OPPURE
  detA = ((-1)^s)*prod(diag(U));
  detInvA = 1/detA;
  
 ```
 ---------------
 
  <h3> Trovare la funzione del polinomio interpolatore</h3>
Formula simbolica del polinomio di interpolazione di Newton nella variabile z Noti i coefficienti a del polinomio nella base di Newton, implemento in
maniera simbolica l'algoritmo di Horner per la valutazione del polinomio di Newton nella variabile simbolica z:

 
 ```
syms z

fun = @(x) x + sqrt(x - 1);
% Punti 1 e 2
n = 3;
% Interpolazione di grado 3 in forma di NEWTON
xx = linspace(1, 3, n+1);
yy = fun(xx);
xv = linspace(1, 3, 100);
[pol, a] = interpN(xx, yy, xv);


% COSTRUISCO LA FUNZIONE DEL POLINOMIO INTERPOLATORE !!!!
nval = length(xv);
n = length(xx);
ps = a(n);
for k=n-1:-1:1
    ps = ps*(z-xx(k)) + a(k);
end
p = matlabFunction(ps);
```

------------

<h3> Calcolo del determinante tramite fattorizzazione di Chol</h3>

```
[L, p] = chol(A, 'lower');
det(A)
detM = prod(diag(L))^2
```
