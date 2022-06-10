function [y] = app1()
y(1) = log(11) - log(10);
for n=1:29
    y(n+1)=1/n - y(n);
end
end