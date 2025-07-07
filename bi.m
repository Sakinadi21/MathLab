disp('mat');
Ab=input('mat');
[n,m]=size(Ab);
if m~= n+1
    error('invalid')
end
for k=1:n-1
    for i=k+1:n
        if Ab(k,k) == 0
            error ('zero');
        end

        for k =1:n-1
            for i=k+1 :n
                if Ab(k,k)==0
                    error('zero')
                end
                factor=Ab(i,k:m)-factor *Ab(k,k:m);
            end
        end
        x=zeros(n,1);
        x(n) =Ab(n,end)/Ab(n,n);

        for i = n-1:-1:1
            x(i) =(Ab(i,end)-Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
        end
        