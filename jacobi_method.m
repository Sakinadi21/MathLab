% Jacobi Method for solving Ax = b

A = input('Enter coefficient matrix A: ');
b = input('Enter constant vector b: ');
x0 = input('Enter initial guess vector x0: ');
tol = input('Enter tolerance: ');
max_iter = input('Enter maximum number of iterations: ');

n = length(b);
x_old = x0(:);
x_new = zeros(n,1);
errors = zeros(max_iter,1);

for k = 1:max_iter
    for i = 1:n
        sum1 = A(i,1:i-1)*x_old(1:i-1);
        sum2 = A(i,i+1:n)*x_old(i+1:n);
        x_new(i) = (b(i) - sum1 - sum2) / A(i,i);
    end
    
    errors(k) = norm(x_new - x_old, inf);
    fprintf('Iteration %d: x = %s, Error = %.8f\n', k, mat2str(x_new',6), errors(k));
    
    if errors(k) < tol
        fprintf('Converged after %d iterations.\n', k);
        break;
    end
    
    x_old = x_new;
end

if errors(k) >= tol
    disp('Did not converge within maximum iterations.');
end

% Plot convergence of error
figure;
semilogy(1:k, errors(1:k), 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');
xlabel('Iteration');
ylabel('Infinity Norm of Error');
title('Jacobi Method Convergence');
grid on;
