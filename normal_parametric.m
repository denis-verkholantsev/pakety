# поверхность
x = @(u,v) 1.*cos(u).*sin(v);
y = @(u,v) 2.*sin(u).*sin(v);
z = @(u,v) 1.*cos(v);
range = linspace(0,2*pi, 100);
[U,V] = meshgrid(linspace(0,2*pi, 100),linspace(0,pi, 100));
figure
surf(x(U,V), y(U,V), z(U,V))
colormap('ocean');
shading interp;
axis equal
hold on
delta = 0.00001;
#частные проивзодные
dxdu = @(u,v)(x(u+delta,v)- x(u,v))/delta;
dxdv = @(u,v)(x(u,v+delta)-x(u,v))/delta;
dydu = @(u,v)(y(u+delta,v)-y(u,v))/delta;
dydv = @(u,v)(y(u,v + delta)-y(u,v))/delta;
dzdu = @(u,v)(z(u+delta,v)-z(u,v))/delta;
dzdv = @(u,v)(z(u,v+delta)-z(u,v))/delta;
# матрица якоби*
D = @(u,v) [dxdu(u,v), dxdv(u,v); dydu(u,v), dydv(u,v); dzdu(u,v), dzdv(u,v); dxdu(u,v), dxdv(u,v)];
u_ = 1;
v_ = 1;
jac_yz = det(D(u_, v_)(2:3,:));
jac_zx = det(D(u_, v_)(3:4,:));
jac_xy= det(D(u_, v_)(1:2,:));
# точка нормали
x_c = jac_yz/sqrt(jac_xy^2+jac_yz^2+jac_zx^2);
y_c = jac_zx/sqrt(jac_xy^2+jac_yz^2+jac_zx^2);
z_c = jac_xy/sqrt(jac_xy^2+jac_yz^2+jac_zx^2);
# точка поверхности
x_0 = 0;
y_0 = 0;
z_0 = 1;
t = linspace(-1,1,100);
# уравнение нормали
x_ = @(t)x_0+t*(x_c-x_0);
y_ = @(t)y_0+t*(y_c-y_0);
z_ = @(t)z_0+t*(z_c-z_0);
# точка поверхности
plot3(x_0,y_0,z_0,'color','red')
# нормаль
plot3(x_(t),y_(t),z_(t),'color','blue')
