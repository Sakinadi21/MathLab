% LU Decomposition using Crout's Method

A = input('Enter square matrix A: ');
b = input('Enter vector b: ');

n = size(A,1);
L = zeros(n);
U = eye(n);

% Crout's LU factorization
for j = 1:n
    % Compute L's j-th column
    for i = j:n
        sumL = 0;
        for k = 1:j-1
            sumL = sumL + L(i,k)*U(k,j);
        end
        L(i,j) = A(i,j) - sumL;
    end
    % Compute U's j-th row
    for i = j+1:n
        sumU = 0;
        for k = 1:j-1
            sumU = sumU + L(j,k)*U(k,i);
        end
        U(j,i) = (A(j,i) - sumU) / L(j,j);
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
title('Solution Vector x from LU Decomposition (Crout''s Method)');
grid on;
