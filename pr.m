clc;
clear;

% Take 5 lines of input, each with 6 values: [P B C S D Total]
A = zeros(5,6);
disp('Enter 5 equations as: [P B C S D Total]');
for i = 1:5
    A(i,:) = input('');
end

% Separate coefficient matrix and constant vector
coeff = A(:, 1:5);
b = A(:, 6);
aug = [coeff b];

% Initialize lower triangular matrix
L = eye(5);

% Gaussian elimination to form LOWER triangular matrix
for j = 1:4
    for i = j+1:5
        factor = aug(i,j)/aug(j,j);
        L(i,j) = factor;
        aug(i,:) = aug(i,:) - factor * aug(j,:);
    end
end

% Check ranks
rank_coeff = rank(coeff);
rank_aug = rank(aug(:,1:6));
n = size(coeff,2);

% Determine nature of solution
if rank_coeff ~= rank_aug
    comment = 'Comment: No solutions exist.';
elseif rank_coeff < n
    comment = 'Comment: Multiple solutions exist.';
else
    comment = 'Comment: Unique solution exists.';
end

% Back substitution if unique
if strcmp(comment, 'Comment: Unique solution exists.')
    x = zeros(5,1);
    for i = 5:-1:1
        x(i) = (aug(i,6) - aug(i,1:5) * x) / aug(i,i);
    end
end

% Print the output EXACTLY as in sample output
fprintf('\nSample Output\n');
disp(' 1     0     0     0     0');
for i = 2:5
    fprintf('%4.1f %5.1f %5.1f %5.1f %5.1f\n', L(i,1:5));
end
fprintf('%s\n', comment);
if strcmp(comment, 'Comment: Unique solution exists.')
    fprintf('Cost: %.2f, %.2f, %.2f, %.2f, %.2f\n', x);
end
