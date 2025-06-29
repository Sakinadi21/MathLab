% Runge-Kutta 4th Order Method with Plot

f = input('Enter the function dy/dx = f(x, y) as @(x, y): ');
x0 = input('Enter initial value of x (x0): ');
y0 = input('Enter initial value of y (y0): ');
h  = input('Enter step size (h): ');
xn = input('Enter the value of x at which you want y (xn): ');

n = (xn - x0)/h;  % number of steps

x_values = zeros(1, n+1);
y_values = zeros(1, n+1);

x_values(1) = x0;
y_values(1) = y0;

fprintf('\nStep\tx\t\ty\n');
for i = 1:n+1
    fprintf('%d\t%.6f\t%.6f\n', i-1, x0, y0);
    
    x_values(i) = x0;
    y_values(i) = y0;
    
    k1 = h * f(x0, y0);
    k2 = h * f(x0 + h/2, y0 + k1/2);
    k3 = h * f(x0 + h/2, y0 + k2/2);
    k4 = h * f(x0 + h, y0 + k3);
    
    y1 = y0 + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    x0 = x0 + h;
    y0 = y1;
end

fprintf('\nApproximate value of y at x = %.4f is %.6f\n', xn, y_values(end));

% --- Plotting ---
plot(x_values, y_values, 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');
xlabel('x')
ylabel('y')
title('Runge-Kutta 4th Order Method Solution')
grid on
legend('y vs x')
