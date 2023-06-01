function animate_pendulum(t, theta, L)
    figure;
    for i = 1:length(t)
        x = L*sin(theta(i));
        y = -L*cos(theta(i));
        plot([0, x], [0, y], 'LineWidth', 2);
        axis equal;
        xlim([-L, L]);
        ylim([-L, L]);
        drawnow;
    end
end
