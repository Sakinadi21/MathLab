% Cholesky Decomposition Method (A must be symmetric positive definite)

A = input('Enter symmetric positive definite matrix A: ');
b = input('Enter vector b: ');

% Check if A is symmetric and positive definite
if ~isequal(A, A')
    error('Matrix A must be symmetric.');
end
if min(eig(A)) <= 0
    error('Matrix A must be positive definite.');
end

n = size(A,1);
L = zeros(n);

% Cholesky Decomposition (A = L * L')
for i = 1:n
    for j = 1:i
        sum = 0;
        for k = 1:j-1
            sum = sum + L(i,k)*L(j,k);
        end
        if i == j
            L(i,j) = sqrt(A(i,i) - sum);
        else
            L(i,j) = (A(i,j) - sum) / L(j,j);
        end
    end
end

fprintf('\nMatrix L (Lower triangular):\n');
disp(L);
fprintf('Matrix L transpose (Upper triangular):\n');
disp(L');

% Solve Ly = b (Forward substitution)
y = zeros(n,1);
for i = 1:n
    y(i) = (b(i) - L(i,1:i-1)*y(1:i-1)) / L(i,i);
end

% Solve L'x = y (Backward substitution)
x = zeros(n,1);
for i = n:-1:1
    x(i) = (y(i) - L(i+1:n,i)'*x(i+1:n)) / L(i,i);
end

fprintf('\nSolution vector x:\n');
disp(x);

% Plot the solution vector
figure;
plot(1:n, x, 'mo-', 'LineWidth', 2, 'MarkerFaceColor', 'g');
xlabel('Index');
ylabel('Value');
title('Solution Vector x from Cholesky Decomposition');
grid on;
