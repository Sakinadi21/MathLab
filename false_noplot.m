f=input('Enter function as @(x): ');   
a=input ('Enter left endpoint a: ');
b=input('Enter right endpoint b: ');          
n=input('Enter the number of iterations: ');               
if f(a)*f(b)>=0
    disp('Error: f(a) and f(b) must have opposite signs.');
    return;
end
fprintf('\n%-10s %-15s %-15s %-15s %-15s\n','Iter','a','b','c','f(c)');

for i = 1:n   
    c = (a*f(b)-b*f(a))/(f(b)-f(a));
    fc = f(c);
    fprintf('%-10d %-15.6f %-15.6f %-15.6f %-15.6f\n', i, a, b, c, fc);
    if f(a)*fc<0
        b=c;
    else
        a=c;
    end  
end
 fprintf('\nApproximate root= %.4f \n', c);