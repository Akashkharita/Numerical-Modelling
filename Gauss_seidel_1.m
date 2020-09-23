clear all; clc;
C=[10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8]; % Matrix C 
b=[6 25 -11 15]';     
x=[0 0 0 0]';
n=size(x,1);
iter=0;
while iter<10
    x_old=x;
    
    for i=1:n
        
        s=0;
        
        for j=1:i-1
            s=s+C(i,j)*x(j);
        end
        
        for j=i+1:n
                s=s+C(i,j)*x_old(j);
        end
        
        x(i)=(1/C(i,i))*(b(i)-s);
    end
    
    iter=iter+1;
end
fprintf('Solution of the system is : \n%f\n%f\n%f\n%f in %d iterations \n',x,iter);