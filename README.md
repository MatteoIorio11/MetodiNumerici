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
  
  <h3> Calcolo delle norme </h3> 
  
  
 * norma 1 = MASSIMO DEL VALORE ASSOLUTO DELLA SOMMA SULLE COLONNE
  
 * norma 2 = sqrt(p(A^T * A)) -> MASSIMO DEGLI AUTOVALORI IN VALORE ASSOLUTO 
  ```
  %CALCOLO NORMA 2  NEI VETTORI 
  
  n = sqrt(x' * x)
  
  
  % CALCOLO NORMA NELLE MATRICI
  -> [autovalori] = eig(A)
  
          OPPURE 
  
          [n, m] = size(A)
  
  I=eye(n)
  
  -> autovalori => 
         [ (A - a*I)=0 ] devo risolvere questo problema, i risultati di 'a' saranno i miei autovalori.
    
  ```
  * norma infinito = MASSIMO DEL VALORE ASSOLUTO DELLA SOMMA SULLE RIGHE

-----------------
  <h3> Quando è possibile applicare LUsolve : </h3>
  
  Il determinante di tutte le sottomatrici deve essere >= 0 per applicare l'algoritmo LUnopivot o LUpivot 
  
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
 
 
 ```
 [L, U, flag] = LUnopivot(A);
 detA = 1
 for i=1:n
    detA = detA * U(i,i)
  end
  
  % OPPURE
  detA = prod(diag(U))

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
  detA = (-1)^s*detA;
  
  % OPPURE
  detA = (-1)^s*prod(diag(U))

 ```
 
