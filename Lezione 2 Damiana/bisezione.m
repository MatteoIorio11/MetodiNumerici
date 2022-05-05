function [nit, x_k, x_values] = bisezione(fname,A, B, tolx)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
if(fname(A)*fname(B) > 0)
    error('ERRORE : INTERVALLO NON CORRETTO');
else
    nit=1;
    a_k=A;
    b_k=B;
    x_values=[];
    NMAX=log2((B-A)/tolx)-1;
        while nit<=NMAX && abs(b_k-a_k)>tolx
            x_k=a_k+(b_k - a_k)/2;
            x_values(nit)=x_k;
            if(fname(x_k) == 0)
                break
            elseif(sign(fname(x_k))*sign(fname(a_k)) >0)
                a_k=x_k;
            elseif(sign(fname(x_k))*sign(fname(b_k)) >0)
                b_k=x_k;
            end
            nit=nit+1;
        end
end

