%% Welcome to Fun with MATLAB 🚀
clc; clear; close all;

%% 1. Random Number Game 🎲
disp('Guess a random number between 1 and 10');
target = randi(10);
guess = input('Enter your guess: ');
if guess == target
    disp('🎉 Correct! You guessed it!');
else
    fprintf('❌ Nope, the number was %d\n', target);
end

%% 2. Animated Sine Wave 🌊
x = linspace(0, 4*pi, 500);
figure;
for t = 0:0.1:2*pi
    y = sin(x + t);
    plot(x, y, 'm', 'LineWidth', 2);
    title(sprintf('Animated Sine Wave t = %.1f', t));
    xlabel('x'); ylabel('sin(x + t)');
    grid on;
    pause(0.05);
end

%% 3. Image Processing 🖼️ (Built-in Image)
img = imread('peppers.png');
figure; imshow(img); title('Original Image');

% Convert to grayscale and show
grayImg = rgb2gray(img);
figure; imshow(grayImg); title('Grayscale Image');

%% 4. Create a Multiplication Table 📊
n = 5;
table = zeros(n);  % Initialize a matrix
for i = 1:n
    for j = 1:n
        table(i,j) = i * j;
    end
end
disp('Multiplication Table:');
disp(table);

%% 5. Create a Simple Calculator 🧮
a = input('Enter first number: ');
b = input('Enter second number: ');
op = input('Enter operation (+, -, *, /): ', 's');

switch op
    case '+', result = a + b;
    case '-', result = a - b;
    case '*', result = a * b;
    case '/', result = a / b;
    otherwise, result = 'Invalid operation';
end
disp(['Result = ', num2str(result)]);

%% 6. Make Some Noise 🎵
fs = 8000;              % Sampling frequency
duration = 1;           % 1 second
freq = 440;             % A4 note (Hz)
t = 0:1/fs:duration;
note = sin(2*pi*freq*t);
sound(note, fs);        % Play sound

%% 7. Bar Graph of Random Data 📊
data = randi([10, 50], 1, 5);
labels = {'A', 'B', 'C', 'D', 'E'};
figure;
bar(data);
set(gca, 'XTickLabel', labels);
title('Random Data Bar Graph');
ylabel('Value');

%% 8. Save Report to File 📄
fileID = fopen('report.txt', 'w');
fprintf(fileID, 'Random number was: %d\n', target);
fprintf(fileID, 'Your guess was: %d\n', guess);
fprintf(fileID, 'Table (5x5):\n');
fprintf(fileID, '%3d %3d %3d %3d %3d\n', table');
fclose(fileID);
disp('Report saved to report.txt');

%% 9. End Message
disp('🔥 Done! You just explored math, games, plotting, audio, and files in MATLAB! 🔥');
