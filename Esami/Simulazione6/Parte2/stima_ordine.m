function [ordine] = stima_ordine(xk, it)
p = zeros(it, 1);
for k=3:it-1
    p(k-2)=log(abs(xk(k+1)-xk(k))/abs(xk(k)-xk(k-1)))/log(abs(xk(k)-xk(k-1))/abs(xk(k-1) - xk(k-2)));
end
ordine = p(it-3);
end