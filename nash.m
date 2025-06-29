max_iter = 1000;
tol = 1e-6;
sA = 0.5; % Player A's strategy
sB = 0.5; % Player B's strategy
BR_A = @(sb) min(max(1 - 0.8*sb, 0), 1); 
BR_B = @(sa) min(max(1 - 0.6*sa, 0), 1);
historyA = zeros(max_iter,1);
historyB = zeros(max_iter,1);
for i = 1:max_iter
    sA_new = BR_A(sB);
    sB_new = BR_B(sA);
    historyA(i) = sA_new;
    historyB(i) = sB_new; 
    if abs(sA_new - sA) < tol && abs(sB_new - sB) < tol
        fprintf('Equilibrium reached at iteration %d\n', i);
        historyA = historyA(1:i);
        historyB = historyB(1:i);
        break; end  
    sA = sA_new;
    sB = sB_new; end
fprintf('Player A strategy: %.4f\n', sA);
fprintf('Player B strategy: %.4f\n', sB); figure;
plot(1:length(historyA), historyA, '-o', 'LineWidth', 2); hold on;
plot(1:length(historyB), historyB, '-s', 'LineWidth', 2);
xlabel('Iteration');
ylabel('Strategy');
title('Nash Equilibrium via Fixed Point Iteration');
legend('Player A', 'Player B'); grid on;
