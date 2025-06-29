% geometry_calculator.m

x = input('Enter side of square: ');
y = input('Enter height (for rectangle): ');
r = input('Enter radius of circle: ');

% Square
disp('--- Square ---')
Area1 = areaofsq(x)
Perimeter1 = perimetersq(x)

% Rectangle
disp('--- Rectangle ---')
Area2 = areaofrec(x, y)
Perimeter2 = perimeterrec(x, y)

% Circle
disp('--- Circle ---')
Area3 = areacircle(r)
Perimeter3 = perimetercircle(r)

% --- Local functions ---

function A = areaofsq(x)
    A = x^2;
end

function P = perimetersq(x)
    P = 4 * x;
end

function A = areaofrec(l, w)
    A = l * w;
end

function P = perimeterrec(l, w)
    P = 2 * (l + w);
end

function A = areacircle(r)
    A = pi * r^2;
end

function C = perimetercircle(r)
    C = 2 * pi * r;
end
