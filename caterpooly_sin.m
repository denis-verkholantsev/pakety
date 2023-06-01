function trajectory = caterpooly_sin(pos=0.0, speed_x = 0.2, curve=@sin, iters=15)
  xlim([0,100])
  figure
  trajectory = zeros(iters+1,2)
  t=linspace(pos,iters*speed_x,1000);
  plot(t,curve(t));
  trajectory(1,:) = [pos,curve(pos)];
  hold on;
  plot(pos, curve(pos), 'ro', 'MarkerSize', 5);
  hold on;
  grid on;
  for i=1:iters
    pos += speed_x;
    trajectory(i+1,:) = [pos, curve(pos)];
    plot(trajectory(i+1,1),trajectory(i+1,2),'ro', 'MarkerSize', 2);
    drawnow;
    pause(1)
  endfor
endfunction
