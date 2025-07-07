clc;
clear;

% Read number of data points
n = input('Enter number of points: ');

% Read n lines of (x, y)
x = zeros(n,1);
y = zeros(n,1);
disp('Enter each point as: x y');
for i = 1:n
    temp = input('');
    x(i) = temp(1);
    y(i) = temp(2);
end

% Read query point
xq = input('Enter query point: ');

% Compute distances from query point
distances = abs(x - xq);

% Sort by distance and get sorted indices
[~, idx] = sort(distances);

% Ignore two nearest points
ignored = idx(1:2);

% Filter out ignored points
remaining = setdiff(1:n, ignored);

% From remaining, find:
% one forward (x > xq) and one backward (x < xq)
forward_idx = -1;
backward_idx = -1;
for i = remaining
    if x(i) > xq && forward_idx == -1
        forward_idx = i;
    elseif x(i) < xq
        if backward_idx == -1
            backward_idx = i;
        elseif abs(x(i) - xq) < abs(x(backward_idx) - xq)
            backward_idx = i;
        end
    end
end

% Check if valid pair exists
if forward_idx == -1 || backward_idx == -1
    disp('Interpolation not possible with available points.');
else
    % Get two points (x0, y0), (x1, y1)
    x0 = x(backward_idx);
    y0 = y(backward_idx);
    x1 = x(forward_idx);
    y1 = y(forward_idx);

    % Linear interpolation formula
    yq = y0 + ((y1 - y0)/(x1 - x0)) * (xq - x0);

    % Print result upto 4 decimal places
    fprintf('%.4f\n', yq);
end
