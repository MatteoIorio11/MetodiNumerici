function [x,xk,it]=bisez(fname,a,b,tol)

fa=fname(a);
fb=fname(b);
if sign(fa)*sign(fb)>=0
   error('intervallo non corretto');
else
    maxit=ceil(log2((b-a)/tol)-1);
    %fprintf('n. di passi necessari=%d \n',maxit);
    it=0;
    while it<=maxit && abs(b-a)>=tol
        it=it+1;
        xk(it)=a+(b-a)*0.5; 
        %fprintf('it=%d  x=%8.15f \n',it,xk(it));
        fxk=fname(xk(it));
        if fxk==0
            break;
        elseif sign(fxk)*sign(fa)>0
            a=xk(it);
            fa=fxk;
        elseif sign(fxk)*sign(fb)>0
            b=xk(it);
            fb=fxk;
        end
    end
    x=xk(it);
end
