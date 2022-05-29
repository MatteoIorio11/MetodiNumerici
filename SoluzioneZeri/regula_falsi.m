function [x, xk, it] = regula_falsi(fname,a,b,tol,nmax)
fa=fname(a);
fb=fname(b);
if sign(fa)*sign(fb)>=0
   error('intervallo non corretto');
else
    it=0;
    fxk=fname(a);
    while it <= NMAX && abs(b -a)> tol&& abs(fxk) > tol
        it=it+1;
        xk(it)= a - fa*((b -a)/(fb - fa));
        %fprintf('it=%d  x=%8.15f \n',it,xk(it));
        fxk=fname(xk(it));
        fb = fname(b);
        fa = fname(a);
        if fxk==0
            return;
        elseif sign(fxk)*sign(fa)>0
            b = x1;
        elseif sign(fxk)*sign(fb)>0
             a = x1;
        end
    end
    if it==nmax 
        error('Raggiunto numero max di iterazioni');
        x=[];
    else
        x=xk(it);
    end
end
