clc;
clear;

% Input matrix A and vector b from user
disp('Enter the coefficient matrix A:');
A = input('');
disp('Enter the right-hand side column vector b:');
b = input('');

n = length(b);
Aug = [A b]; % Augmented matrix

% Gauss Elimination with Partial Pivoting
for i = 1:n-1
    % Partial Pivoting
    [~, pivot_row] = max(abs(Aug(i:n, i)));
    pivot_row = pivot_row + i - 1;

    if pivot_row ~= i
        Aug([i, pivot_row], :) = Aug([pivot_row, i], :);  % Swap rows
    end

    for j = i+1:n
        factor = Aug(j, i) / Aug(i, i);
        Aug(j, :) = Aug(j, :) - factor * Aug(i, :);
    end
end

% Back Substitution
x = zeros(n,1);
x(n) = Aug(n,end)/Aug(n,n);
for i = n-1:-1:1
    x(i) = (Aug(i,end) - Aug(i,i+1:n)*x(i+1:n)) / Aug(i,i);
end

fprintf('\nSolution using Gauss Elimination with Partial Pivoting:\n');
disp(x);
