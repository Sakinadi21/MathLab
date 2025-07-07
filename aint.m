n=input('Enter number of points: ');
x=zeros(n,1);
y=zeros(n,1);
disp('Enter x y :');
for i=1:n 
    temp=input('');
    x(i)=temp(1);
    y(i)=temp(2);
end
xq=input('Enter query x value: ');
distances=abs(x-xq);
[~,idx] =sort(distances);
ignored =idx(1:2);
remaining = setdiff(1:n,ignored);
forward_idx=-1;
backward_idx =-1;
for i=remaining
    if x(i)>xq && forward_idx==-1
        forward_idx=i;
    elseif x(i)<xq
        if backward_idx==-1
            backward_idx=i;
        elseif abs(x(i)-xq) <abs(x(backward_idx) - xq)
            backward_idx=i;
        end
    end
end

if forward_idx==-1||backward_idx==-1
    disp('Not possible to interpolate.');
else
    x0=x(backward_idx);
    y0=y(backward_idx);
    x1=x(forward_idx);
    y1=y(forward_idx);
    yq=y0+((y1-y0)/(x1-x0))*(xq-x0);
    fprintf('Interpolated y value at x = %.4f is y = %.4f\n', xq, yq);
end
