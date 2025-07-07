clc;
clear;

% Define the function and its derivative
f = @(x) x.^2 - 2;               % Original function
df = @(x) 2*x;                   % Derivative of f(x)
g = @(x) 0.5 * (x + 2./x);       % Fixed-point function

% Initialization
x0 = 1;           % Initial guess
N = 20;           % Maximum number of iterations
tol = 1e-6;       % Tolerance for convergence
true_val = sqrt(2); % Exact root

% Preallocate arrays
x_fp_vals = zeros(1, N);
x_nr_vals = zeros(1, N);
error_fp = zeros(1, N);
error_nr = zeros(1, N);

%% Fixed Point Iteration
x = x0;
fprintf('\nFixed Point Iteration:\n');
for i = 1:N
    x_new = g(x);
    x_fp_vals(i) = x_new;
    error_fp(i) = abs(x_new - true_val);
    fprintf('Iter %2d: x = %.10f, error = %.2e\n', i, x_new, error_fp(i));
    if abs(x_new - x) < tol
        x_fp_vals(i+1:end) = [];
        error_fp(i+1:end) = [];
        break;
    end
    x = x_new;
end
fp_iters = length(x_fp_vals);
fp_final = x_fp_vals(end);

%% Newton-Raphson Iteration
x = x0;
fprintf('\nNewton-Raphson Iteration:\n');
for i = 1:N
    x_new = x - f(x)/df(x);
    x_nr_vals(i) = x_new;
    error_nr(i) = abs(x_new - true_val);
    fprintf('Iter %2d: x = %.10f, error = %.2e\n', i, x_new, error_nr(i));
    if abs(x_new - x) < tol
        x_nr_vals(i+1:end) = [];
        error_nr(i+1:end) = [];
        break;
    end
    x = x_new;
end
nr_iters = length(x_nr_vals);
nr_final = x_nr_vals(end);

%% Print Summary
fprintf('\nSummary:\n');
fprintf('Method             Iterations    Approximation      Error\n');
fprintf('-------------------------------------------------------------\n');
fprintf('Fixed Point        %5d         %.10f   %.2e\n', fp_iters, fp_final, error_fp(end));
fprintf('Newton-Raphson     %5d         %.10f   %.2e\n', nr_iters, nr_final, error_nr(end));

%% Plot Convergence
figure;
semilogy(1:fp_iters, error_fp, 'r-o', 'LineWidth', 1.5, 'DisplayName', 'Fixed Point');
hold on;
semilogy(1:nr_iters, error_nr, 'b-s', 'LineWidth', 1.5, 'DisplayName', 'Newton-Raphson');
xlabel('Iteration');
ylabel('Absolute Error (log scale)');
title('Convergence Comparison: Fixed Point vs Newton-Raphson');
legend show;
grid on;
