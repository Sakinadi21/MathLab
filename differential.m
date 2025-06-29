% Numerical Differentiation: Forward, Backward, Central Differences

f = input('Enter the function f(x) as @(x): ');
a = input('Enter start of interval (a): ');
b = input('Enter end of interval (b): ');
h = input('Enter step size h: ');

x = a:h:b;

% Function values
y = f(x);

% Forward Difference
df_forward = (f(x + h) - f(x)) ./ h;

% Backward Difference
df_backward = (f(x) - f(x - h)) ./ h;

% Central Difference (excluding ends)
x_central = x(2:end-1);
df_central = (f(x_central + h) - f(x_central - h)) ./ (2*h);

% Plotting
figure;
plot(x, y, 'b-', 'LineWidth', 2); hold on;
plot(x, df_forward, 'r--', 'LineWidth', 2);
plot(x, df_backward, 'g-.', 'LineWidth', 2);
plot(x_central, df_central, 'k:', 'LineWidth', 2);
legend('f(x)', 'Forward Diff', 'Backward Diff', 'Central Diff');
xlabel('x');
ylabel('y and dy/dx');
title('Numerical Differentiation');
grid on;
