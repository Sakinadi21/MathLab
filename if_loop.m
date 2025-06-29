% Generate random integers from 1 to 5
A = randi([1, 5], 1, 100000000);  % 1x100 million array

% Using IF with vectorized sum
clc
tic
num3_if = sum(A == 3);  % Count how many elements equal 3
if num3_if >= 0.2 * length(A)
    disp('wow')
end
Time_if = toc;

% Using FOR loop
clc
tic
num3_for = 0;
for i = 1:length(A)
    if A(i) == 3
        num3_for = num3_for + 1;
    end
end
if num3_for >= 0.2 * length(A)
    disp('wow')
end
Time_for = toc;

% Show timing
fprintf('Time_if = %.4f seconds\n', Time_if);
fprintf('Time_for = %.4f seconds\n', Time_for);
