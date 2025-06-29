% Newton's Method for a System of Nonlinear Equations with Plot

% Define functions as vector F(x)
F = @(x) [x(1)^2 + x(2)^2 - 4;         % f1(x, y) = x² + y² - 4
          x(1) - exp(-x(2))];          % f2(x, y) = x - e^(-y)

% Define Jacobian matrix J(x)
J = @(x) [2*x(1),      2*x(2);         % ∂f1/∂x , ∂f1/∂y
          1,           exp(-x(2))];    % ∂f2/∂x , ∂f2/∂y

% Input values
x0 = input('Enter initial guess as a vector [x y]: ');
tol = input('Enter tolerance: ');
n = input('Enter max number of iterations: ');

% Newton's iteration
for i = 1:n
    Fx = F(x0);
    Jx = J(x0);
    
    dx = -Jx\Fx;   % Solve J(x)*dx = -F(x)
    x1 = x0 + dx;  % Update
    
    fprintf('Iteration %d: x = [%.6f, %.6f]\n', i, x1(1), x1(2));
    
    if norm(dx, inf) < tol
        fprintf('Converged to solution: x = [%.6f, %.6f]\n', x1(1), x1(2));
        break
    end
    x0 = x1;
end

% Plotting the curves f1 = 0 and f2 = 0
[xg, yg] = meshgrid(-3:0.01:3, -3:0.01:3);
f1 = xg.^2 + yg.^2 - 4;
f2 = xg - exp(-yg);

contour(xg, yg, f1, [0 0], 'r', 'LineWidth', 1.5); hold on;
contour(xg, yg, f2, [0 0], 'b', 'LineWidth', 1.5);
plot(x1(1), x1(2), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
xlabel('x')
ylabel('y')
title('Solution of Nonlinear System using Newton''s Method')
legend('f1(x,y)=0', 'f2(x,y)=0', 'Solution')
grid on
hold off
