f=input('enter your function as @(x) : ');
a=input ('enter the left side : ');
b=input('enput the right side : ');
n=input('iteration : ');
e=input('tolerance : ');
if f(a)*f(b) >=0
    disp('Error : f(a) and f(b) must have opposite signs.');
    return;
end 
fprintf('\n %-10s %-15s %-15s %-15s %-15s\n','Iter','a','b','c','f(c)');
for i = 1:n
    c=(a*f(b)-b*f(a))/(f(b)-f(a));
    fc=f(c);

    fprintf('%-10d %15.6f %15.6f %15.6f %15.6f\n',i, a,b,c,fc);
    if abs(fc)< e
        fprintf('\n appropriate root =%.6f\n',c);
        break;
    end 

    if f(a)*fc<0
        b=c;
    else 
        a=c;
    end 
end 