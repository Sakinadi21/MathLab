% ingredients
f = input('Enter your function as @(x): ');
x0 = input('Enter first initial guess x0: ');
x1 = input('Enter second initial guess x1: ');
e = input('Enter tolerance: ');
n = input('Enter number of iterations: ');

% processing
hasConverged = false;
for i = 1:n
    if f(x1) == f(x0)
        disp('Secant method failed: division by zero');
        break
    end
    
    x2 = x1 - f(x1)*(x1 - x0)/(f(x1) - f(x0));
    fprintf('x%d = %.10f\n', i, x2);
    
    if abs(x2 - x1) < e
        fprintf('Converged to root at x = %.10f\n', x2);
        hasConverged = true;
        break
    end
    
    x0 = x1;
    x1 = x2;
end

% final root for plotting
if ~hasConverged
    x2 = x1;  
end

% Plotting
x_vals = linspace(x2 - 2, x2 + 2, 400);
y_vals = arrayfun(f, x_vals);

plot(x_vals, y_vals, 'b-', 'LineWidth', 2); hold on;
plot(x2, f(x2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
yline(0, 'k--');  % x-axis
xlabel('x')
ylabel('f(x)')
title('Secant Method Approximation')
legend('f(x)', 'Approximate Root', 'Location', 'best')
grid on; hold off;
