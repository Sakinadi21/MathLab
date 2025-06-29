% LU Decomposition using Doolittle's Method

A = input('Enter square matrix A: ');
b = input('Enter vector b: ');

n = size(A,1);
L = eye(n);
U = zeros(n);

% Doolittle LU factorization
for k = 1:n
    % Compute U's k-th row
    for j = k:n
        U(k,j) = A(k,j) - L(k,1:k-1)*U(1:k-1,j);
    end
    % Compute L's k-th column
    for i = k+1:n
        L(i,k) = (A(i,k) - L(i,1:k-1)*U(1:k-1,k)) / U(k,k);
    end
end

fprintf('\nMatrix L:\n');
disp(L);
fprintf('Matrix U:\n');
disp(U);

% Solve Ly = b (Forward substitution)
y = zeros(n,1);
for i = 1:n
    y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
end

% Solve Ux = y (Backward substitution)
x = zeros(n,1);
for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
end

fprintf('\nSolution vector x:\n');
disp(x);

% Plot the solution vector
figure;
plot(1:n, x, 'bo-', 'LineWidth', 2, 'MarkerFaceColor', 'r');
xlabel('Index');
ylabel('Value');
title('Solution Vector x from LU Decomposition');
grid on;
