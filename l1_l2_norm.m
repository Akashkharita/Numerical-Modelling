clear all; close all
X = [1:10];
Y = [2 4 5 8 7 8 5 9 12 16];

plot(X, Y,'o');
xlabel('X')
ylabel('Y')
title('Points distribution')

% error functions
%err1 = @(y1,y2) XXX;
%err2 = @(y1,y2) XXX;

% line
y = @(m,c,x) m*x + c;

% approximate range
N = 100;
mmin = -5; mmax = 15;
cmin = -10; cmax = 25;
%mrange = linspace(mmin,mmax,N)';
%crange = linspace(mmin,mmax,N)';
mrange = mmin + mmax*rand(N,1);
crange = cmin + cmax*rand(N,1);
mrange = sort(mrange);
crange = sort(crange);

err = zeros(length(mrange),length(crange));
err_l1 = zeros(length(mrange),length(crange));   
err_l2 = zeros(length(mrange),length(crange));    
% grid search
for ii = 1:length(mrange)
    for jj = 1:length(crange)
        err_l1(ii,jj) = sum(Y-mrange(ii)*X-crange(jj));  % By definition of L1 norm 
        err_l2(ii,jj) = sum((Y-mrange(ii)*X-crange(jj)).^2)^(0.5); % By definition of L2 norm
    end
end
figure
surf(err_l1)
title('L1 norm')
figure
surf(err_l2)
title('L2 norm')

% find minimum
% l1
min_err = min(min(abs(err_l1)));
[row,col] = find(min_err==abs(err_l1)); % returns the row and column of the minimum error value
m1 = mrange(row);
c1 = crange(col);
x = linspace(1,10);
figure(1); hold on
plot(x,y(m1,c1,x),'r')

% l2
min_err = min(min(abs(err_l2)));
[row,col] = find(min_err==abs(err_l2));
m1 = mrange(row);
c1 = crange(col);
x = linspace(1,10);
figure(1); hold on
plot(x,y(m1,c1,x),'k')