function [p] = stimaOrdine(approssimazioni)
[n] = length(approssimazioni);
for i=1:n
    num = log(abs(approssimazioni(i+2)-approssimazioni(i+3))/abs(approssimazioni(i+1)-approssimazioni(i+2)))
    den = log(abs(approssimazioni(i+1)-approssimazioni(i+2))/abs(approssimazioni(i)-approssimazioni(i+1)))
    p = num/den;
end
end