
x = linspace(0, 5);               % Creates 100 points from 0 to 5
y = exp(x) .* ((x - 3).^2) + 10;  % Use element-wise multiplication with .*

plot(x, y);                       % Plot y vs x

max_y = max(y);                   % Optional: get the maximum value of y
disp(max_y);                      % Display the max value

value_y = y(20);                  % Get the 20th element of y
disp(value_y);

value_x = x(2);                   % Get the 2nd element of x
disp(value_x);
