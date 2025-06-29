% Newton's Divided Difference Interpolation

% Input section
x = input('Enter x values (any spacing): ');
y = input('Enter corresponding y values: ');
xp = input('Enter the x point to interpolate: ');

n = length(x);
dd_table = zeros(n, n);
dd_table(:,1) = y(:);  % First column = y values

% Compute divided differences
for j = 2:n
    for i = 1:n-j+1
        dd_table(i,j) = (dd_table(i+1,j-1) - dd_table(i,j-1)) / (x(i+j-1) - x(i));
    end
end

disp('Divided Difference Table:');
disp(dd_table);

% Interpolation using Newton's formula
yp = y(1);
product_term = 1;

for i = 1:n-1
    product_term = product_term * (xp - x(i));
    yp = yp + dd_table(1,i+1) * product_term;
end

fprintf('\nInterpolated value at x = %.4f is %.6f\n', xp, yp);

% Optional Plot
xx = linspace(min(x), max(x), 1000);
yy = zeros(size(xx));

for k = 1:length(xx)
    temp = y(1);
    prod_term = 1;
    for i = 1:n-1
        prod_term = prod_term * (xx(k) - x(i));
        temp = temp + dd_table(1,i+1) * prod_term;
    end
    yy(k) = temp;
end

figure;
plot(x, y, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(xx, yy, 'b-', 'LineWidth', 2);
plot(xp, yp, 'ks', 'MarkerFaceColor', 'g');
xlabel('x');
ylabel('y');
title('Newton Divided Difference Interpolation');
legend('Data Points', 'Interpolated Curve', 'Interpolated Point');
grid on;
