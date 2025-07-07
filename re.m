clc;
clear;

% Get the function from user as a string
func_str = input('Enter the function in terms of x (e.g., x^3 - x - 2): ', 's');
f = str2func(['@(x)', func_str]);

% Get user-defined interval [a, b]
a = input('Enter the lower bound a: ');
b = input('Enter the upper bound b: ');

% Check validity of interval
if f(a) * f(b) > 0
    disp('Invalid interval. f(a) and f(b) must have opposite signs.');
    return;
end

% Parameters
tol = 1e-5;
max_iter = 100;
iter = 0;

fprintf('\nIter\t   a\t\t   b\t\t   c\t\tf(c)\n');

% Plotting
x_vals = linspace(a-1, b+1, 500);
y_vals = arrayfun(f, x_vals);
plot(x_vals, y_vals, 'b-', 'LineWidth', 1.5);
hold on;
grid on;
xlabel('x');
ylabel('f(x)');
title(['Plot of f(x) = ', func_str]);
yline(0, '--k');  % x-axis line

% Regula Falsi Iteration
while iter < max_iter
    fa = f(a);
    fb = f(b);
    c = (a*fb - b*fa) / (fb - fa);
    fc = f(c);

    fprintf('%d\t%f\t%f\t%f\t%f\n', iter, a, b, c, fc);
    plot(c, fc, 'ro');  % mark current approximation

    if abs(fc) < tol
        fprintf('\nApproximate root found: %.6f\n', c);
        break;
    end

    if fa * fc < 0
        b = c;
    else
        a = c;
    end

    iter = iter + 1;
end

if iter == max_iter
    fprintf('\nMaximum iterations reached without convergence.\n');
end

hold off;
