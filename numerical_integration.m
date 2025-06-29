% Newton-Cotes Numerical Integration (Closed Formulas)

f = input('Enter the function f(x) as @(x): ');
a = input('Enter lower limit a: ');
b = input('Enter upper limit b: ');
n = input('Enter degree (1=Trapezoid, 2=Simpson1/3, 3=Simpson3/8, 4=Boole): ');

% Subintervals (must match degree)
if n < 1 || n > 4
    error('Degree must be between 1 and 4 for closed Newton-Cotes formulas.');
end

h = (b - a) / n;
x = a:h:b;
y = f(x);

% Apply Newton-Cotes formulas
switch n
    case 1 % Trapezoidal Rule
        I = h * (y(1) + y(2)) / 2;
        rule = "Trapezoidal Rule";
        
    case 2 % Simpson's 1/3 Rule
        I = h * (y(1) + 4*y(2) + y(3)) / 3;
        rule = "Simpson's 1/3 Rule";
        
    case 3 % Simpson's 3/8 Rule
        I = 3*h * (y(1) + 3*y(2) + 3*y(3) + y(4)) / 8;
        rule = "Simpson's 3/8 Rule";
        
    case 4 % Boole’s Rule
        I = 2*h * (7*y(1) + 32*y(2) + 12*y(3) + 32*y(4) + 7*y(5)) / 45;
        rule = "Boole’s Rule";
end

fprintf('\nApproximate Integral using %s = %.6f\n', rule, I);

% Plotting
xx = linspace(a, b, 1000);
yy = f(xx);
figure;
plot(xx, yy, 'b-', 'LineWidth', 2); hold on;
plot(x, y, 'ro', 'MarkerFaceColor', 'r');
xlabel('x'); ylabel('f(x)');
title(sprintf('Function Plot with %s', rule));
grid on;
legend('f(x)', 'Sample Points');
