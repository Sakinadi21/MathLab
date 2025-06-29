nx = 20; ny = 20;
max_iter = 500;
tol = 1e-4;
T = zeros(nx, ny);
T(1,:) = 100;      
T(end,:) = 0;      
T(:,1) = 75;       
T(:,end) = 50;     
T_old = T;
for k = 1:max_iter
    for i = 2:nx-1
        for j = 2:ny-1
            T(i,j) = 0.25 * (T_old(i+1,j) + T_old(i-1,j) + T_old(i,j+1) + T_old(i,j-1));
        end
    end
    if max(max(abs(T - T_old))) < tol
        fprintf('Converged after %d iterations\n', k);
        break;
    end
    T_old = T;
end
figure;
surf(T);
xlabel('X'); ylabel('Y'); zlabel('Temperature');
title('2D Heat Distribution using Fixed Point Iteration');
colorbar;
