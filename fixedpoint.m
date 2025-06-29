g = input('Enter your function g(x) as @(x): ');
x0 = input('Enter initial guess x0: ');
n = input('Enter number of iterations: ');
e = input('Enter tolerance: ');

for i = 1:n
    x1 = g(x0);
    fprintf('Iteration %d: x = %.6f\n', i, x1);
    
    if abs(x1 - x0) < e
        fprintf('Converged to %.6f within tolerance.\n', x1);
        break
    end
    
    x0 = x1;
end

% Plot g(x) and y=x line, mark the fixed point
x_vals = linspace(x1-2, x1+2, 400);
y_g = arrayfun(g, x_vals);

plot(x_vals, y_g, 'b-', 'LineWidth', 2);
hold on
plot(x_vals, x_vals, 'k--', 'LineWidth', 1.5); % y=x line
plot(x1, x1, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
xlabel('x')
ylabel('g(x)')
title('Fixed Point Iteration: g(x) and y = x')
grid on
hold off
