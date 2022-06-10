function [val] = norma1(A)
val = sum(abs(A(:, 1)));
[n] = size(A,2);
val = max(sum(abs(A([1:n],:))));
end