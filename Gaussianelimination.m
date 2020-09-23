% Matlab Program to solve (nxn) system equation 
% by using Gaussian Elimination method 
clear ; clc ; close all
C = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6 25 -11 15];
n = length(b);
b = b';
A = [ C  b ];
for j = 1:(n-1)
        for i= (j+1) : n
            mult = A(i,j)/A(j,j);
            for k= j:n+1
                A(i,k) = A(i,k) - mult*A(j,k);
            end
        end
end
x = zeros(n,1);
for i = n:-1:1
    x(i) = (A(i,n+1)-A(i,n)*x(n)-A(i,n-1)*x(n-1)-A(i,n-2)*x(n-2))/A(i,i);
end
    