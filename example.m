% Example Problem
% Parameters
max_x = 6.3;
x = linspace(0, max_x, 100000);
y = sin(x);              % Corrected: sinx → sin(x)
y_check = 0.7;           % You need to define a value for y_check

% Actions
plot(x, y, '.'), hold on
plot([0 max_x], [y_check y_check], '-r')   % Corrected: lpot → plot, fixed vector size

y_greater = y > y_check;    % Corrected: -y>y_check → y > y_check

% Output
FinalPercent = sum(y_greater) / length(y) * 100;  % Percentage of points above y_check
disp(['FinalPercent = ', num2str(FinalPercent), '%'])  % Display result
