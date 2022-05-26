clc
clear all
close all

LLe = zeros(1, 4);
LLc = zeros(1, 4);
xx = linspace(-1, 1, 200);
it = 1;
for n=5:5:20
    xe = linspace(-1, 1, n+1);
    xc = cos((2*[0:n] +1)*pi/(2*(n+1)));
    Le = zeros(1, 200);
    Lc = zeros(1, 200);
    for i=1:n+1
        pe = plagr(xe, i);
        Le = Le + abs(polyval(pe, xx));
        
        pc = plagr(xc, 1);
        Lc = Lc + abs(polyval(pc, xx));
    end
    LLe(it) = max(Le);
    LLc(it) = max(Lc);    
    it = it +1;
end
figure(1)
semilogy(1:4, LLc, 1:4, LLe);

