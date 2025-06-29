x = input('Enter a number: ');
r = rem(x, 1);

if x < 0 && r == 0
    fprintf('Square of your number = %d\n', x^2)
elseif x > 0 && r == 0
    fprintf('Square root of your number = %.2f\n', sqrt(x))
elseif x < 0 && r ~= 0
    fprintf('Cube of your number = %d\n', x^3)
elseif x > 0 && r ~= 0
    fprintf('Cube root of your number = %.2f\n', nthroot(x, 3))
else
    disp('Check your inputs')
end
