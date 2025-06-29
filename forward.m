% Newton Forward Interpolation

% Inputs
x = input('Enter x values (equally spaced): ');
y = input('Enter corresponding y values: ');
xp = input('Enter the x point to interpolate (within range): ');

n = length(x);
h = x(2) - x(1);  % Assuming equally spaced

% Compute forward difference table
diff_table = zeros(n, n);
diff_table(:,1) = y(:);  % First column is y

for j = 2:n
    for i = 1:(n - j + 1)
        diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
    end
end

disp('Forward Difference Table:');
disp(diff_table);

% Interpolation formula
u = (xp - x(1)) / h;
yp = y(1);
fact = 1;
u_term = 1;

for i = 1:n-1
    u_term = u_term * (u - (i - 1));
    fact = fact * i;
    yp = yp + (u_term * diff_table(1,i+1)) / fact;
end

fprintf('\nInterpolated value at x = %.4f is %.6f\n', xp, yp);

% Optional: plot
xx = linspace(x(1), x(end), 1000);
yy = zeros(size(xx));
for k = 1:length(xx)
    u = (xx(k) - x(1)) / h;
    yp = y(1);
    fact = 1;
    u_term = 1;
    for i = 1:n-1
        u_term = u_term * (u - (i - 1));
        fact = fact * i;
        yp = yp + (u_term * diff_table(1,i+1)) / fact;
    end
    yy(k) = yp;
end

figure;
plot(x, y, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(xx, yy, 'b-', 'LineWidth', 2);
plot(xp, yp, 'ks', 'MarkerFaceColor', 'g');
legend('Data Points', 'Interpolated Curve', 'Interpolated Point');
xlabel('x');
ylabel('y');
title('Newton Forward Interpolation');
grid on;
