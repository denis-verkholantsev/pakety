function trajectory = caterpooly(pos=[0,0], speed=[0.4,0.8], low_left=[-1,-1], top_right=[5,5], iters=25)
    trajectory = zeros(iters+1,2);
    figure;
    plot(pos(1), pos(2), 'ro', 'MarkerSize', 5);
    xlim([low_left(1), top_right(1)]);
    ylim([low_left(2), top_right(2)]);
    rectangle('Position', [low_left(1), low_left(2), top_right(1) - low_left(1), top_right(2) - low_left(2)]);
    xlabel('x');
    ylabel('y');
    hold on;
    grid on;
    for i = 1:iters
        if pos(1) <= low_left(1) || pos(1) >= top_right(1)
            speed(1) *= -1;
        endif
        if pos(2) <= low_left(2) || pos(2) >= top_right(2)
            speed(2) *= -1;
        endif
        pos(1) += speed(1);
        pos(2) += speed(2);
        trajectory(i+1,:) = pos;
        plot(pos(1), pos(2), 'ro', 'MarkerSize', 2);
        drawnow;
        pause(0.4)
    endfor
endfunction

