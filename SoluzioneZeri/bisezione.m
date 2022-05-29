function [x,xk,it]=bisez(fname,a,b,tol)

fa=fname(a);
fb=fname(b);
if  sign(fb) * sign(fa) > 0
   error('intervallo non corretto');
else
    maxit= ceil(log2((B-A)/tolx) -1)
    %fprintf('n. di passi necessari=%d \n',maxit);
    it=0;
    while it<=maxit && abs(b-a)>=tol
        it=it+1;
         %calcola xk(it) con la formula corrispondente
        xk(it) = A + (B-A) * 0.5
        fxk=fname(xk(it));
        if fxk==0
            break;
        elseif sign(fxk)*sign(fa)>0
            B = xk(it)
        elseif sign(fxk)*sign(fb)>0
            A = xk(it)
        end
    end
    x=xk(it);
end
