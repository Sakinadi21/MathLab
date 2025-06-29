f = input('Enter your function as @(x): ');
a = input('Enter left side of interval: ');
b = input('Enter right side of interval: ');
n = input('Enter no of iterations: ');
e = input('Enter tolerance: ');

if f(a) * f(b) < 0
    for i = 1:n
        c = (a + b) / 2;
        fprintf('P%d = %.6f\n', i, c)
        
        if abs(b - a) < e
            fprintf('Approximate root = %.6f (within tolerance)\n', c)
            break
        end
        
        if f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
    end
    
    % Plot the function and the root
    x_vals = linspace(a - 1, b + 1, 400);
    y_vals = arrayfun(f, x_vals);
    plot(x_vals, y_vals, 'b-', 'LineWidth', 2);
    hold on
    plot(c, f(c), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    yline(0, 'k--'); % x-axis
    xlabel('x')
    ylabel('f(x)')
    title('Function plot with root approximation')
    grid on
    hold off
    
else
    disp('Function does not change sign in the interval.')
end
