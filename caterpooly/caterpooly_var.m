function trajectory = caterpooly_var(pos=0.0, speed_x = 0.2, curve=@(x,y) x.^2+y.^2, iters=15) #curve = curve(x,y)
  t=linspace(-100,100,1000);
  [X,Y] = meshgrid(t,t);
  plot(curve(X,Y));
  figure
  trajectory = zeros(iters+1,2)
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
