clc
clear all
close all

fx = @(x) 1./(1+900*x.^2);
xx = linspace(-1, 1, 100)';
it = 1;
for n=5:5:30
    for i=1:n+1
        xie(i) = -1 + 2*(i-1)/n;
    end
    for i=n+1:-1:1
%                     (2*[n+1:-1:1]-1)*pi/(2*(n+1))
        xic(i) = cos((2*i-1)*pi/(2*(n+1)));
    end
    yie = fx(xie);
    yic = fx(xic);
    [pval1, a1] = InterpN(xie, yie, xx);
    [pval2, a2] = InterpN(xic, yic, xx);
    yy = fx(xx);
    rcx = abs(fx(xx) - pval2);
    figure(1)
    subplot(2,3,it);
    plot(xx, abs(yy - pval1));     title(['Equidistanti n=',num2str(n)]);
    figure(2)
    subplot(2,3,it);
    plot(xx, abs(yy - pval2)); title(['Chebichev n=',num2str(n)]);
    it = it +1;
    %plot(xie, yie, 'ro', xx, pval1, 'b-', xic, yic, 'go', xx, pval2, 'k-');
    %legend('Primo set', 'Interpolazione primo set', 'Secondo Set', 'Interpolazione secondo Set');
end

% Costante di lesguesueue 
it = 1;
LLe = zeros(6, 1);
LLc = zeros(6, 1);
for n=5:5:30
    %nodi equispaziati
    xie=-1+2*([1:n+1]-1)/n;
    %nodi di Chebyshev
    xic = cos((2*[n+1:-1:1]-1)*pi/(2*(n+1)));
    Le = zeros(100, 1);
    Lc = zeros(100, 1);
    for i=1:n+1
        pe = plagr(xie, i);
        pc = plagr(xic, i);
        Le = Le+abs(polyval(pe, xx));
        Lc = Lc+abs(polyval(pc, xx));
    end
    LLe(it) = max(Le);
    LLc(it) = max(Lc);
    it = it+1;
end
figure(3)
semilogy([1:6 ],LLe,'r',[1:6 ],LLc,'b')
legend('Nodi equispaziati', 'Nodi di cheb')
