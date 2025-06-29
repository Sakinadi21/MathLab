%% MATLAB Beginner's Guide Script

clc; clear; close all;  % Clean workspace, command window, and figures

%% 1. Variables and Basic Math
a = 10;
b = 5;
sum_ab = a + b;
product_ab = a * b;
fprintf('Sum: %d, Product: %d\n', sum_ab, product_ab);

%% 2. Vectors and Matrices
v = [1 2 3 4 5];            % Row vector
m = [1 2; 3 4];             % 2x2 matrix
v_squared = v .^ 2;         % Element-wise square

%% 3. Conditional Statement (if-else)
x = 7;
if mod(x,2) == 0
    disp('x is even');
else
    disp('x is odd');
end

%% 4. For Loop
disp('Squares using for loop:');
for i = 1:5
    fprintf('%d^2 = %d\n', i, i^2);
end

%% 5. While Loop
disp('Countdown using while loop:');
z = 5;
while z > 0
    disp(z);
    z = z - 1;
end

%% 6. Plotting
x = linspace(0, 2*pi, 100);
y = sin(x);
figure;
plot(x, y, 'b', 'LineWidth', 2);
title('Sine Wave');
xlabel('x-axis');
ylabel('sin(x)');
grid on;

%% 7. Function Usage
result = squareNumber(6);
fprintf('6 squared using function = %d\n', result);

%% 8. File I/O
save('myData.mat', 'a', 'b', 'v');      % Save variables to file
clear a b v                             % Clear them from workspace
load('myData.mat');                     % Load them again
disp('Data loaded from file:');
disp(a); disp(b); disp(v);

%% 9. Custom Function (at the end of the file or separate file)
% See function defined below

%% 10. Finish
disp('--- Script Finished ---');

%% --- FUNCTION DEFINITIONS ---
function y = squareNumber(x)
    y = x^2;
end
