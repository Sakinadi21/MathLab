% Simpson's 1/3 Rule Numerical Integration

f = input('Enter the function f(x) as @(x): ');
a = input('Enter the lower limit of integration (a): ');
b = input('Enter the upper limit of integration (b): ');
n = input('Enter the number of subintervals (even number): ');

% Ensure n is even
if mod(n,2) ~= 0
    error('Number of subintervals must be even.');
end

h = (b - a) / n;
x = a:h:b;
y = f(x);

% Simpson's 1/3 formula
I = h/3 * ( y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) );

fprintf('\nApproximate integral value using Simpson''s 1/3 Rule = %.6f\n', I);

% Plotting the function
xx = linspace(a, b, 1000);
yy = f(xx);
plot(xx, yy, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Function to be Integrated');
grid on;
