clc;
clear;
f=input('Enter your equation as @(x): ');
a=input('left interval : ');
b=input('right interval : ');
n=input('iteration no : ');
e=input('tolerance: ');
if f(a)*f(b) >=0
    disp('error:f(a) and f(b) must have opposite signs')
    return;
end
fprintf('\n%-10s %-15s %-15s %-15s %-15s\n','Iter','a','b','c','f(c)');

for i=1:n
     c = (a*f(b) - b*f(a)) / (f(b) - f(a));
    fc = f(c);
      fprintf('%-10d %-15.6f %-15.6f %-15.6f %-15.6f\n', i, a, b, c, fc);
      if abs(fc)<e
             fprintf('\nApproximate root = %.4f (within tolerance)\n', c);
        break;
      end
        if f(a)*fc < 0
        b = c;
    else
        a = c;
    end
end
