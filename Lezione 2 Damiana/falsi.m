function [nit, output, x_values] = falsi(fname,A, B, tolx, tolf, NMAX)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
iterator=1;
xk=0;
A_attu=A;
B_attu=B;
valf=fname(A);
x_values=[];
    while iterator<=NMAX && abs(B-A)>tolx && abs(valf) > tolf
        xk=A_attu - fname(A_attu)*((B_attu - A_attu)/(fname(B_attu) - fname(A_attu)));
        x_values(iterator)=xk;
        valf=fname(xk);
        if valf == 0
            break
        elseif (sign(valf) * sign(fname(A_attu)) > 0)
            A_attu=xk;
        elseif (sign(valf) * sign(fname(B_attu)) > 0)
            B_attu=xk;
        end
        iterator=iterator+1;
    end
    nit=iterator;
    output=xk;
end

