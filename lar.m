clc;
clear;

% User input
x = input('Enter the x data points as a row vector: ');
y = input('Enter the corresponding y data points as a row vector: ');
xp = input('Enter the x value to interpolate at: ');

n = length(x);
yp = 0;

for i = 1:n
    L = 1;
    for j = 1:n
        if j ~= i
            L = L * (xp - x(j)) / (x(i) - x(j));
        end
    end
    yp = yp + L * y(i);
end

fprintf('The interpolated value at x = %.4f is y = %.4f\n', xp, yp);
