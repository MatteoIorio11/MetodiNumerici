clc
clear all
close all

it = 1;
xx = linspace(-1, 1, 100);
LLe=zeros(1,4);
LLc=zeros(1,4);

for n=5:5:20
    % Valori equispazati
    xe = linspace(-1, 1, n+1);
    % Valori di Cheb
    xc = cos((2*[1:n+1] -1)*pi/(2*(n+1)));

    Le = zeros(100, 1);
    Lc = zeros(100, 1);
    for i=1:n+1
        pe = plagr(xe, i);
        Le = Le + abs(polyval(pe, xx))';
        pc = plagr(xc, i);
        Lc = Lc + abs(polyval(pc, xx))';
    end
    LLe(it) = max(Le);
    LLc(it) = max(Lc);
    it = it + 1;
end