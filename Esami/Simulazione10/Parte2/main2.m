clc
clear all
close all


fx = @(x) 1./(2+sin(pi.*x)) - x.^2.*cos(pi.*x);
xx = linspace(0, 2, 100);
yy = fx(xx);
figure
plot(xx, yy);
x = [0.5:0.5:1.5];
y = fx(x);
[pol] = InterpL(x, y, xx);
figure(2)
plot(x, y, 'bo', xx, pol, 'r-')

rx = abs(yy - pol);
figure(3)
plot(xx, rx, 'k-');

val = abs(yy(1) - pol(1))/abs(yy(1));
k = pol(1);

for i=1:100
    val2 = abs(yy(i) - pol(i))/abs(yy(i));
    if val < val2
        k = i;
    end
end
xx(i)





