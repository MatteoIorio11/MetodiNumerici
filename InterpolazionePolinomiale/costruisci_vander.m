function [A] = costruisci_vander(x, n)
m=length(x);
A=zeros(m,n);

for j=1:n
    A(:,j)=  x.^(j-1);
end