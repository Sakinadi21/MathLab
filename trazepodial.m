% Trapezoidal Rule Numerical Integration

f = input('Enter the function f(x) as @(x): ');
a = input('Enter the lower limit of integration (a): ');
b = input('Enter the upper limit of integration (b): ');
n = input('Enter the number of subintervals: ');

h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);

% Trapezoidal Rule formula
I = (h/2) * (y(1) + 2*sum(y(2:end-1)) + y(end));
fprintf('\nApproximate integral value using Trapezoidal Rule = %.6f\n', I);

% Plotting the function
xx = linspace(a, b, 1000);
yy = f(xx);
plot(xx, yy, 'b-', 'LineWidth', 2); hold on;

% Plot trapezoids
for i = 1:n
    Xtrap = [x(i) x(i) x(i+1) x(i+1)];
    Ytrap = [0 y(i) y(i+1) 0];
    fill(Xtrap, Ytrap, 'r', 'FaceAlpha', 0.3, 'EdgeColor', 'r');
end

xlabel('x');
ylabel('f(x)');
title('Trapezoidal Rule Approximation');
grid on;
hold off;
