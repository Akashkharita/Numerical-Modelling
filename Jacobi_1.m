clear all; clc;
C=[10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b=[6 25 -11 15]';
x=[0 0 0 0]';          % Akash Kharita
n=size(x,1);
itr=0;
while itr < 10    % no. of iterations can be adjusted here
    xold=x;             % in jacobi we use old values 
    
    for i=1:n
        sigma=0;
        
        for j=1:n
            
            if j~=i
                sigma=sigma+C(i,j)*x(j);
            end
            
        end
        
        x(i)=(1/C(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
end
fprintf('Solution of the system is : \n%f\n%f\n%f\n%f in %d iterations \n',x,itr);