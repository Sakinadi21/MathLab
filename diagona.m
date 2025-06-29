% Diagonally Dominant System - Gauss-Seidel with Plot

% Example diagonally dominant matrix (or input your own)
A = input('Enter a diagonally dominant matrix A: ');
b = input('Enter RHS vector b: ');
x0 = input('Enter initial guess vector x0: ');
tol = input('Enter tolerance: ');
max_iter = input('Enter maximum number of iterations: ');

n = length(b);
x = x0(:);
errors = zeros(max_iter,1);
x_history = zeros(n, max_iter);

% Gauss-Seidel Iteration
for k = 1:max_iter
    x_old = x;
    for i = 1:n
        sum1 = A(i,1:i-1)*x(1:i-1);
        sum2 = A(i,i+1:n)*x_old(i+1:n);
        x(i) = (b(i) - sum1 - sum2) / A(i,i);
    end
    x_history(:,k) = x;
    errors(k) = norm(x - x_old, inf);
    
    if errors(k) < tol
        fprintf('Converged in %d iterations.\n', k);
        break;
    end
end

% Trim unused iterations
x_history = x_history(:, 1:k);
errors = errors(1:k);

% Final solution
fprintf('\nFinal solution vector x:\n');
disp(x);

% Plot error convergence
figure;
semilogy(1:k, errors, 'r-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');
xlabel('Iteration');
ylabel('Infinity Norm of Error');
title('Convergence of Gauss-Seidel (Diagonally Dominant System)');
grid on;

% Optional: Plot each variable over iterations
figure;
hold on;
colors = lines(n);
for i = 1:n
    plot(1:k, x_history(i,:), 'Color', colors(i,:), 'LineWidth', 2, ...
        'DisplayName', ['x_' num2str(i)]);
end
xlabel('Iteration');
ylabel('Value');
title('Solution Variables Over Iterations');
legend('show');
grid on;
