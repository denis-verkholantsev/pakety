function normal_explicit2(z, point) # z=z(x,y) , point=[.., ..]
  delta = 0.00001;
  dzdx = @(x,y) (z(x+delta,y) - z(x,y))/delta;
  dzdy = @(x,y) (z(x,y+delta) - z(x,y))/delta;
  [X,Y] = meshgrid(linspace(-10,10,100),linspace(-10,10,100));
  surf(X,Y, z(X,Y));
  shading interp
  hold on
  x_0 = point(1);
  y_0 = point(2);
  z_0 = z(x_0,y_0);
  quiver3(x_0, y_0, z_0, dzdx(x_0,y_0), dzdy(x_0,y_0), -1, 'r', 'linewidth', 2, 'showArrowHead', 'off', 'color', 'red');
  scatter3(x_0, y_0, z_0, 10, 'ro', 'filled');
  hold off
endfunction

