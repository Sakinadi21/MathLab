% ingredients
f = input('Enter your function as @(x): ');
df = input('Enter derivative of this function as @(x): ');
e = input('Enter tolerance: ');
x0 = input('Enter initial guess: ');
n = input('Enter no of iteration: ');

% processing
hasConverged = false;
if df(x0) ~= 0
    for i = 1:n
        x1 = x0 - f(x0) / df(x0);
        fprintf('x%d = %.10f\n', i, x1);

        if abs(x1 - x0) < e
            fprintf('Converged to root at x = %.10f\n', x1);
            hasConverged = true;
            break
        end

        if df(x1) == 0
            disp('Newton-Raphson failed: derivative became zero');
            break
        end

        x0 = x1;
    end
else
    disp('Newton-Raphson failed: derivative is zero at initial guess');
end

% Plotting
if hasConverged
    x_vals = linspace(x1 - 2, x1 + 2, 400);
    y_vals = arrayfun(f, x_vals);

    plot(x_vals, y_vals, 'b-', 'LineWidth', 2); hold on;
    plot(x1, f(x1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');  % Root
    yline(0, 'k--');  % x-axis
    xlabel('x')
    ylabel('f(x)')
    title('Newton-Raphson Method Result')
    legend('f(x)', 'Approximate Root', 'Location', 'best')
    grid on; hold off;
end
