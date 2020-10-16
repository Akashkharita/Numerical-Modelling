%% assignment Fourier series exercise question-2
% Fourier series approximation for boxcar function 
% Akash Kharita - 17411002
% Please run the file and see the figure
clc; clear all; close all;

    x = [-pi:0.1:pi]; % range of X
    x1 = [-pi:0.1:0]; % since this function is 
    x2 = [0:0.1:pi];
    N = 10; % number of fourier coefficients
    
    % actual function
    y1 = zeros(length(x1));
    y2 = pi*ones(length(x2));
    % plot
    figure;
    plot([-pi:0.1:0],y1,'b','LineWidth',3,'DisplayName','f(x)'); grid on
    hold on;
    plot([0:0.1:pi],y2,'r','LineWidth',3,'DisplayName','f(x)');
    xlabel('x')
    ylabel('f(x)')
    hold on;
    
    % Compute coefficients 
    a0 = pi/2;
    for ii = 1:N
        an(ii) = 0;
        bn(ii) = (1-cos(ii*pi))/(ii);
    end
    
    fx_ii = zeros(1,length(x)); % Initialize
    for ii = 1:N
        fourier_coeff = (an(ii)*cos(ii*x) + bn(ii)*sin(ii*x));
        fx_ii = fx_ii + fourier_coeff;
        plot(x,fx_ii+pi/2,'LineWidth',2,'DisplayName',['N = ',num2str(ii)]) % Uncomment this line to see ALL of them
    end
    legend show