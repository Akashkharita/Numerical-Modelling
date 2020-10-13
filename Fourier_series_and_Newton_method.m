iex = 2;

if iex == 1
    x = [-pi,0.1,pi];
    N = 10;   % No. of maximum fourier coefficients
    
    
    % the example function we are taking here
    fx = @(x) x;
    
    %plot
    figure;
    plot(x,fx(x),'k','Linewidth',3,'f(x)'); grid on
    xlabel('x')
    hold on;
    
    % compute coefficients (see the lecture notes on how to compute them)
    a0 = 0;
    
    for ii = 1:N            % Now we have stored the values in our variables a and b
        an(ii) = 0;
        bn(ii) = (2/ii)*(-1)^(ii+1);
    end
    fx_ii = zeros(1,length(x));
    for ii = 1:N
        fourier_coeff = (an(ii)*cos(ii*x)+bn(ii)*sin(ii*x));  %fourier_coeff actually containis the no. of terms equal to length(x)
        fx_ii = fx_ii+fourier_coeff;
        plot(x,fx_ii,'LineWidth',2,'DisplayName',['N =',num2sr(ii)])
    end
    legend show
end
%% Newton's method
if iex == 2
    x = [-1.5:0.01:2.5];
    N = 6;
    
    % actual function
    fx = @(x) 2*x.^3 - 3*x.^2 - 3*x + 2;
    dfx = @(x) 6*x.^2 - 6*x -3;
    % plot
    figure;
    plot(x,fx(x),'k','LineWidth',3,'DisplayName','f(x)'); grid on
    xlabel('x')
    ylabel('f(x)')
    hold on;
     % Iterate over to find roots
    x_ii = -0.16;
    for ii = 1:N
        x_next = x_ii - fx(x_ii)/dfx(x_ii);
        y = fx(x_ii) + dfx(x_ii)*(x - x_ii); %(y - y0) = m(x - x0)
        % plot
        plot(x,y,'LineWidth',2,'DisplayName',['N = ',num2str(ii)])
        % Update x
        x_ii = x_next;
        % print
        disp(sprintf('Iteration = %d, x = %0.3f',ii, x_ii));
    end
    legend show
    plot([x(1) x(end)],[0 0],'--k','DisplayName','x-axis'); 
    plot([0 0],[-10 10],'--k','DisplayName','y-axis');
end
    


    
        