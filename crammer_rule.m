% Cramer's Rule for solving:
% a1*x + b1*y = c1
% a2*x + b2*y = c2

% Input coefficients
a1 = input('Enter a1: ');
b1 = input('Enter b1: ');
c1 = input('Enter c1: ');

a2 = input('Enter a2: ');
b2 = input('Enter b2: ');
c2 = input('Enter c2: ');

% Compute determinants
D  = a1*b2 - a2*b1;
Dx = c1*b2 - c2*b1;
Dy = a1*c2 - a2*c1;

if D ~= 0
    x = Dx / D;
    y = Dy / D;
    
    fprintf('\nUnique solution found:\n');
    fprintf('x = %.4f\n', x);
    fprintf('y = %.4f\n', y);
    
    % Plot the lines and intersection point
    x_vals = linspace(x-5, x+5, 100);
    y1 = (c1 - a1*x_vals) / b1;
    y2 = (c2 - a2*x_vals) / b2;

    plot(x_vals, y1, 'r-', 'LineWidth', 2); hold on;
    plot(x_vals, y2, 'b-', 'LineWidth', 2);
    plot(x, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
    legend('Equation 1', 'Equation 2', 'Intersection Point', 'Location', 'best');
    xlabel('x');
    ylabel('y');
    title('Solution of 2x2 System using Cramer''s Rule');
    grid on;
    hold off;

else
    if Dx == 0 && Dy == 0
        disp('Infinite solutions (dependent equations)');
    else
        disp('No solution (inconsistent equations)');
    end
end
