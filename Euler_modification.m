%% Example 5: Euler's method [ dy/dx = xy 
    % initial condition
    x0 = 0;
    y0 = 3;
    
    % initialize
    x = [0:0.1:2];
    
    % Plot actual solution
    y = @(x) 3*exp(-2*x); % analytical solution    
    plot(x,y(x),'k','LineWidth',2); % plot analytical solution
    hold on
    
    % Compute numerical solution
    deltax = 0.4; % discretization in x
    xvec = [x0:deltax:x(end)];
    yvec(1) = y0;
    for ii=1:length(xvec)
        yvec(ii+1) = yvec(ii) + (-2*yvec(ii)+0.2)*deltax; % KEY Modification done by adding 0.2
        plot(xvec(ii),yvec(ii),'o','MarkerFaceColor','y','MarkerEdgeColor','k')
    end
    
    deltax = 0.1; % smalled discretization (more accurate results)
    xvec = [x0:deltax:x(end)];
    yvec(1) = y0;
    for ii=1:length(xvec)
        yvec(ii+1) = yvec(ii) + (-2*yvec(ii)+0.2)*deltax; % KEY     Modification added
        plot(xvec(ii),yvec(ii),'o','MarkerFaceColor','c','MarkerEdgeColor','k')
    end
    
    
    
    xlabel('x'); ylabel('y');
    title('Euler solution to $\frac{dy}{dx} = -2y$','interpreter','latex')
   