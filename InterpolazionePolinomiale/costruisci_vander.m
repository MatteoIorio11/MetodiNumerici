function [A] = costruisci_vander(x, n)
% Tale matrice verrà poi utilizzata nei metodi : metodiEN, metodiQR
m=length(x);
A=zeros(m,n);

for j=1:n
    A(:,j)=  x.^(j-1);
end
