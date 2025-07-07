f=input('Enter your function @(x) : ');
df=input('Enter derivative : @(x)');
e=input('tolerance : ');
x0=input('Enter inital guess : ');
n=input('Enter of iteration: ');
hasConvereged=false;
if df(x0)~=0 
    for i=1:n 
        x1=x0-f(x0)/df(x0);
        fprintf('%d=%.10f\n',i,x1);
        if abs (x1-x0) < e
            fprintf('Converged to root at x=%.10f\n',x1);
            hasConvereged =true;
            break
        end
        if df(x1)==0
            disp('Newton failed');
            break
        end
        x0=x1;
    end
else
    disp('newton failed ');
end 