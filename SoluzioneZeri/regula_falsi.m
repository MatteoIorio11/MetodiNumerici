function [x, xk, it] = regula_falsi(fname,a,b,tol,nmax)
       
fa=fname(a);
fb=fname(b);
if sign(fa)*sign(fb)>=0
   error('intervallo non corretto');
else
    it=1;
    fxk=fname(a);
    while it<nmax && abs(b-a)>=tol && abs(fxk)>=tol 
        % m = (fb-fa)/(b-a);
        % d = fa/d;
        % xk(it) = a -d;
        xk(it)=a-fa*(b-a)/(fb-fa);
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
            it=it+1;
    end
    if it==nmax 
        error('Raggiunto numero max di iterazioni');
        x=[];
    else
        x=xk(it);
    end
end
