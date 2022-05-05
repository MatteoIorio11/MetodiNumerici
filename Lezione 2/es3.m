clc
clear all

t=53;
U=1024;
nmax=floor(log10((2^t -1)*2^(U-t)))
[10^(nmax), 10^(nmax+1)]
