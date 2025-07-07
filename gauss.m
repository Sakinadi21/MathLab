
clc;
clear;

% Ask user to input 3x3 matrix A
disp('Enter the 3x3 coefficient matrix A row-wise, e.g., [2 -1 3; 4 2 -1; -6 1 2]:');
A = input('A = ');

% Ask user to input 3x1 vector b
disp('Enter the 3x1 right-hand side vector b, e.g., [5; 1; -3]:');
b = input('b = ');

n = length(b);
Aug = [A b]; % Augmented matrix

% Gauss-Jordan Elimination
for i = 1:n
    % Make pivot 1
    Aug(i,:) = Aug(i,:) / Aug(i,i);
    
    % Make other elements in column 0
    for j = 1:n
        if i ~= j
            Aug(j,:) = Aug(j,:) - Aug(j,i) * Aug(i,:);
        end
    end
end

% Extract solution
x = Aug(:, end);

fprintf('\nSolution using Gauss-Jordan Elimination:\n');
disp(x);

% Plotting if 3-variable system
if n == 3
    [x1, x2] = meshgrid(-10:1:10, -10:1:10);

    % Coefficients for each plane
    a1 = A(1,1); b1 = A(1,2); c1 = A(1,3); d1 = b(1);
    a2 = A(2,1); b2 = A(2,2); c2 = A(2,3); d2 = b(2);
    a3 = A(3,1); b3 = A(3,2); c3 = A(3,3); d3 = b(3);

    % Plane equations
    z1 = (d1 - a1*x1 - b1*x2) / c1;
    z2 = (d2 - a2*x1 - b2*x2) / c2;
    z3 = (d3 - a3*x1 - b3*x2) / c3;

    figure;
    surf(x1, x2, z1, 'FaceAlpha', 0.6); hold on;
    surf(x1, x2, z2, 'FaceAlpha', 0.6);
    surf(x1, x2, z3, 'FaceAlpha', 0.6);
    plot3(x(1), x(2), x(3), 'r*', 'MarkerSize', 10, 'LineWidth', 2);
    xlabel('x'); ylabel('y'); zlabel('z');
    title('Intersection of 3 Planes using Gauss-Jordan');
    legend('Plane 1','Plane 2','Plane 3','Solution Point');
    grid on;
end
