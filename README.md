# MetodiNumerici

<h3> indice di condizionamento </h3>
  
dove f = @(x) x^2 + x^3 ......;
  
K = ( |x| * |f'(x)| ) / |f(x)|

indice di condizionamento <Matrice>

  A = zeros(n, n)

  % La norma dell'inversa di A * la norma della matrice A

  K = norm(A^-1,2)*norm(A, 2);


  Se K >> 1 il problema è mal condizionato

  ------------

  <h3> Come capire se un'operazione è stabile : </h3> 

  x = 10^-5 + sqrt(10^5 - 10000000000000000000000000000000000000000000000000000000000000000)

  -> Vedrai che questa operazione avrà come risultato 0, vuol dire che questa formula soffre della CANCELLAZIONE NUMERICA.
  
  In generale per vedere se è stabile basta vedere se per un qualche valore il tuo risultato è 0
  
  
  a*x^2 + b*x + c = 0
  
  x1*x2=c / a
  
  --------------
  
  <h3> NORMA DUE UNITARIA : </h3>
  
 V = [....]
  
 x = norm(V, 2)
  
 V = V / x;
  
  
 -------------
  
  norma 1 = MASSIMO DEL VALORE ASSOLUTO DELLA SOMMA SULLE COLONNE
  
  norma 2 = sqrt(p(A^T * A)) p -> raggio spettrale -> MASSIMO DEGLI AUTOVALORI IN VALORE ASSOLUTO 
  
  -> [autovalori] = eig(A)
    

  norma infinito = MASSIMO DEL VALORE ASSOLUTO DELLA SOMMA SULLE RIGHE













