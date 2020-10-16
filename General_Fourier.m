%% assignment Fourier series exercise question-2(b)
% General script for calculating all the fourier coefficients and plotting
% Akash kharita 17411002
% Please run the file and see the diagram, Change the input parameters
% according to your needs
clc; clear all; close all;
    h = 0.00001;
    x = [-pi:h:pi]; % range of X
    N = 10; % number of fourier coefficients
    a = 0;
    b = 3;
    c = 0;
 
    % actual function
    f0 = @(a,b,c,x) a*x.^2+b*x+c;
    y = f0(a,b,c,x);
    % plot
    figure;
    plot(x,y,'b','LineWidth',3,'DisplayName','f(x)'); grid on
    xlabel('x')
    ylabel('f(x)')
    hold on;
    
    % Compute coefficients 
    a0 = (1/(2*pi))*(h/2)*(y(1)+sum(2*y(2:end-1))+y(end));
   
    for ii = 1:N
        f1 = @(a,b,c,n,x) (a*x.^2+b*x+c)*(cos(n*x))';
        y1 = f1(a,b,c,ii,x);
        an(ii) = (1/(2*pi))*(h/2)*(y1(1)+sum(2*y1(2:end-1))+y1(end));
        f2 = @(a,b,c,n,x) (a*x.^2+b*x+c)*(sin(n*x))';
        y2 = f2(a,b,c,ii,x);
        bn(ii) = (1/(2*pi))*(h/2)*(y2(1)+sum(2*y2(2:end-1))+y2(end));
    end
    
    fx_ii = zeros(1,length(x)); % Initialize
    for ii = 1:N
        fourier_coeff = (an(ii)*cos(ii*x) + bn(ii)*sin(ii*x));
        fx_ii = fx_ii + fourier_coeff;
        plot(x,fx_ii+a0,'LineWidth',2,'DisplayName',['N = ',num2str(ii)]) % Uncomment this line to see ALL of them
    end
    legend show