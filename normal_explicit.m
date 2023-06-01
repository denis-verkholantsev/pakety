function normal_explicit(z = @(x,y) x.^2-y.^2, point=[1,2], lim_x=[-10,10],lim_y=[-10,10]) # z = z(x,y), point=[.. , ..]
  delta=0.001;
  dzdx = @(x,y) (z(x+delta,y) - z(x,y))/delta;
  dzdy = @(x,y) (z(x,y+delta) - z(x,y))/delta;
  [X,Y] = meshgrid(linspace(-10,10,100),linspace(-10,10,100));
  xlim(lim_x);
  ylim(lim_y)
  surf(X,Y, z(X,Y));
  shading interp;
  hold on;
  title("normal'")
  t=linspace(-10,10,1000);
  x_0 = point(1);
  y_0 = point(2);
  z_0 = z(x_0,y_0);
  x_= x_0+t.*dzdx(x_0,y_0);
  y_= y_0+t.*dzdy(x_0,y_0);
  z_= z_0-t;
  scatter3(x_0, y_0, z_0, 10, 'ro', 'filled');
  plot3(x_,y_, z_,'color','red', 'r-', 'LineWidth', 1);
  hold off
endfunction

