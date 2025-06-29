% Input data points
x = input('Enter x data as a vector (e.g., [1 2 3 4 5]): ');
y = input('Enter y data as a vector (same length as x): ');
deg = input('Enter degree of polynomial to fit: ');

% Fit polynomial coefficients
p = polyfit(x, y, deg);

% Generate points for smooth curve
x_fit = linspace(min(x), max(x), 200);
y_fit = polyval(p, x_fit);

% Plot data points and fitted curve
plot(x, y, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); hold on;
plot(x_fit, y_fit, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title(sprintf('Polynomial Curve Fitting (Degree = %d)', deg));
legend('Data Points', 'Fitted Curve', 'Location', 'best');
grid on;
hold off;
