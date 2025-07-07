clc;
clear;

% User inputs
f = input('Enter your function as @(x): ');         % Example: @(x) x^3 - x - 2
a = input('Enter the left endpoint a: ');           % Interval start
b = input('Enter the right endpoint b: ');          % Interval end
n = input('Enter the number of iterations: ');      % Max iterations
e = input('Enter the tolerance: ');                 % Tolerance

% Check if valid interval
if f(a)*f(b) >= 0
    disp('Error: f(a) and f(b) must have opposite signs.');
    return;
end

fprintf('\n%-10s %-15s %-15s %-15s %-15s\n','Iter','a','b','c','f(c)');

for i = 1:n
    c = (a + b) / 2;
    fc = f(c);
    
    % Display iteration results
    fprintf('%-10d %-15.6f %-15.6f %-15.6f %-15.6f\n', i, a, b, c, fc);

    % Check for convergence
    if abs(fc) < e || abs(b - a) < e
        fprintf('\nApproximate root = %.6f (within tolerance)\n', c);
        break;
    end

    % Update interval
    if f(a)*fc < 0
        b = c;
    else
        a = c;
    end
end
