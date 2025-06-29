x=input('Enter a number to print its table: ')
r=rem(x,1);
if x>1 && r==0
    i=1;
    while i<=10
        fprintf('%d X %d = %d\n',x,i,x*i)
        i=i+1;
    end 
else 
    disp ('Table not found')
end 