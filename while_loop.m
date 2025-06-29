% while loop
z = 100;
while z > 75
    disp(sqrt(z))   % or use display(sqrt(z))
    z = z - 1;      % decrement z to eventually end the loop
end
disp('loop ended')
