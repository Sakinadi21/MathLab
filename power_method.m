% Power Method for Dominant Eigenvalue with Plot

A = input('Enter the matrix A: ');
x0 = input('Enter initial guess vector x0 (column vector): ');
n = input('Enter number of iterations: ');
tol = input('Enter tolerance: ');

x = x0 / norm(x0);   % Normalize initial vector
lambda_old = 0;
lambda_history = zeros(1, n);  % to store eigenvalues

fprintf('\nIter\tEigenvalue (approx)\n');
for i = 1:n
    x_new = A * x;
    lambda_new = max(abs(x_new)) / max(abs(x));  % Rayleigh quotient approx
    x = x_new / norm(x_new);  % normalize
    
    lambda_history(i) = lambda_new;
    fprintf('%d\t%.10f\n', i, lambda_new);
    
    if abs(lambda_new - lambda_old) < tol
        fprintf('\nConverged eigenvalue = %.10f\n', lambda_new);
        break;
    end
    
    lambda_old = lambda_new;
end

fprintf('Approximate dominant eigenvector:\n');
disp(x);

% Plot convergence of eigenvalue
plot(1:i, lambda_history(1:i), 'bo-', 'LineWidth', 2, 'MarkerFaceColor', 'r');
xlabel('Iteration')
ylabel('Dominant Eigenvalue Estimate')
title('Convergence of Power Method')
grid on
