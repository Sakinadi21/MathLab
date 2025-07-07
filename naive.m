clc;
clear;

% User input for augmented matrix [A | b]
disp('Enter the augmented matrix [A|b] row-wise.');
disp('Example: [2 -1 1 8; -3 -1 2 -11; -2 1 2 -3]');
Ab = input('Enter the augmented matrix: ');

[n, m] = size(Ab);

if m ~= n+1
    error('Invalid augmented matrix. It must have n rows and n+1 columns.');
end

% Forward Elimination
for k = 1:n-1
    for i = k+1:n
        if Ab(k,k) == 0
            error('Zero pivot encountered. Naive Gauss cannot proceed.');
        end
        factor = Ab(i,k)/Ab(k,k);
        Ab(i,k:m) = Ab(i,k:m) - factor * Ab(k,k:m);
    end
end

% Back Substitution
x = zeros(n,1);
x(n) = Ab(n,end)/Ab(n,n);

for i = n-1:-1:1
    x(i) = (Ab(i,end) - Ab(i,i+1:n)*x(i+1:n)) / Ab(i,i);
end

% Display solution
disp('The solution vector x is:');
disp(x);
