% Gaussian Quadrature Numerical Integration

f = input('Enter the function f(x) as @(x): ');
a = input('Enter lower limit a: ');
b = input('Enter upper limit b: ');
n = input('Enter number of Gauss points (2–4): ');

% Get weights (w) and nodes (xi) for standard interval [-1,1]
switch n
    case 2
        xi = [-1/sqrt(3), 1/sqrt(3)];
        w = [1, 1];
    case 3
        xi = [-sqrt(3/5), 0, sqrt(3/5)];
        w = [5/9, 8/9, 5/9];
    case 4
        xi = [-sqrt((3 + 2*sqrt(6/5))/7), -sqrt((3 - 2*sqrt(6/5))/7), ...
               sqrt((3 - 2*sqrt(6/5))/7),  sqrt((3 + 2*sqrt(6/5))/7)];
        w = [(18 - sqrt(30))/36, (18 + sqrt(30))/36, ...
             (18 + sqrt(30))/36, (18 - sqrt(30))/36];
    otherwise
        error('Only 2, 3, or 4-point Gaussian Quadrature supported.');
end

% Transform to interval [a, b]
I = 0;
for i = 1:n
    x = ((b - a)/2) * xi(i) + (a + b)/2;
    I = I + w(i) * f(x);
end
I = I * (b - a)/2;

fprintf('\nApproximate integral using %d-point Gaussian Quadrature = %.6f\n', n, I);

% Plot the function and sampling points
xx = linspace(a, b, 1000);
yy = f(xx);
figure;
plot(xx, yy, 'b-', 'LineWidth', 2); hold on;

% Plot sample points used
x_gauss = ((b - a)/2) * xi + (a + b)/2;
y_gauss = f(x_gauss);
plot(x_gauss, y_gauss, 'ro', 'MarkerFaceColor', 'r');

xlabel('x');
ylabel('f(x)');
title(sprintf('%d-Point Gaussian Quadrature', n));
legend('f(x)', 'Gaussian Points');
grid on;
