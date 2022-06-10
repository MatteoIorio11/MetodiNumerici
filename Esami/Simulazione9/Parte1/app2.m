function [z] = app2()
z(31)=0;
for n=30:-1:1
    z(n)=1/10 * (1/n - z(n+1));
end
end