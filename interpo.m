clc;
clear;

% Take input for two points
x1 = input('Enter x1: ');
y1 = input('Enter y1: ');
x2 = input('Enter x2: ');
y2 = input('Enter y2: ');

% Query point where interpolation is to be done
xq = input('Enter x value to interpolate at: ');

% Linear interpolation formula
yq = y1 + ((y2 - y1)/(x2 - x1)) * (xq - x1);

% Display result
fprintf('Interpolated value at x = %.4f is y = %.4f\n', xq, yq);
