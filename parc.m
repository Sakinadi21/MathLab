
x = linspace(-10,10);
y1 = (-(x-3).^2)+10;
y2 = (-(x-3).^2)+15;
y3 = (-(x-3).^2)+20;

figure(1)
plot(x,y1,'--m','MarkerFaceColor','m','MarkerSize',10)
xlabel('x'),ylabel('y'),title('Y vs. X -Problem A')
hold on

figure(2)
plot(x,y2,'bv')
figure(3)
plot(x,y3,'g*');
