clc;
clear;

% Input from user
x = input('Enter x data points as a row vector: ');
y = input('Enter y data points as a row vector: ');
xp = input('Enter the value of x to interpolate at: ');

n = length(x);

% Divided Difference Table
div_diff = zeros(n, n);
div_diff(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        div_diff(i,j) = (div_diff(i+1,j-1) - div_diff(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% Display divided difference table (optional)
disp('Divided Difference Table:');
disp(div_diff);

% Interpolation using Newton's formula
yp = div_diff(1,1);
prod_term = 1;

for i = 1:n-1
    prod_term = prod_term * (xp - x(i));
    yp = yp + div_diff(1,i+1) * prod_term;
end

fprintf('The interpolated value at x = %.4f is y = %.4f\n', xp, yp);
