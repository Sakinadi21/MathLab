% Heun's Method to solve dy/dx = f(x, y)

% Input
f = input('Enter the function dy/dx = f(x, y) as @(x, y): ');
x0 = input('Enter initial x (x0): ');
y0 = input('Enter initial y (y0): ');
h  = input('Enter step size h: ');
xn = input('Enter final x (xn): ');

% Number of steps
n = (xn - x0)/h;

% Arrays to store x and y values
x_vals = x0:h:xn;
y_vals = zeros(1, length(x_vals));
y_vals(1) = y0;

% Heun's Method loop
fprintf('\nStep\t x\t\t y\n');
fprintf('-----------------------------\n');
for i = 1:n
    x = x_vals(i);
    y = y_vals(i);
    
    y_pred = y + h * f(x, y);                           % Euler prediction
    y_corr = y + (h/2) * (f(x, y) + f(x + h, y_pred));  % Heun correction
    
    y_vals(i + 1) = y_corr;
    
    fprintf('%d\t %.6f\t %.6f\n', i-1, x, y);
end

% Final output
fprintf('\nApproximate value of y at x = %.4f is %.6f\n', xn, y_vals(end));

% Plotting
plot(x_vals, y_vals, 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');
xlabel('x')
ylabel('y')
title('Heun''s Method Solution of dy/dx = f(x, y)')
grid on
legend('Approximate y(x)')
