x=input('x: ');
y=input('y: ');
xp=input('x interpolate :');

n=length(x);
yp=0;
for i=1:n
    L=1;
for j=1:n 
        if j~=i 
            L = L *(xp-x(j))/(x(i)-x(j));
        end 
    end
    yp = yp+L*y(i);
end 
fprintf('interpolated x =%.4f is y=%.4f\n',xp,yp);