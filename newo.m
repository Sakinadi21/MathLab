x=input('x :');
y=input('y :');
xp=input('x to interpoloate');
n=length(x);
div_diff=zeros(n,n);
div_diff(:,1)=y';
for j=2:n 
    for i=1:n-j+1
        div_diff(i,j)=(div_diff(i,j-1))/(x(i+j-1)-x(i));
    end
end
disp('table');
disp(div_diff);
yp =div_diff(1,1);
prod_term=1;
for i=1:n-1
   prod_term = prod_term*(xp-x(i));
   yp=yp+div_diff(1,i+1)*prod_term;
end
