function ordineOutput=ortdine(vettore, it)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
p=zeros(it,1);
for k = 3:it-1
    num=log((abs(vettore(k+1)-vettore(k)))/(abs(vettore(k)-vettore(k-1))));
    den=log((abs(vettore(k)-vettore(k-1)))/(abs(vettore(k-1)-vettore(k-2))));
    p(k-2)=num/den;
end
ordineOutput=p(it-3);
