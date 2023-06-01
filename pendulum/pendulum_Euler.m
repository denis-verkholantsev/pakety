function [t, theta] = pendulum_Euler(theta0, omega0, g, L, t_max, dt)
    t = 0:dt:t_max;
    n = length(t);
    theta = zeros(1, n);
    omega = zeros(1, n);
    theta(1) = theta0;
    omega(1) = omega0;
    for i = 2:n
        omega(i) = omega(i-1) - (g/L)*sin(theta(i-1))*dt;
        theta(i) = theta(i-1) + omega(i)*dt;
    end
end
