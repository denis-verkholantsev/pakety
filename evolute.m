a=2;
b=3;
step = 0.01;
#правая ветвь гиперболы
x= @(t) a*cosh(t);
y= @(t) b*sinh(t);
#1 и 2 производные
dfx = @(t)(x(t+step)-x(t))/step;
dfy = @(t)(y(t+step)-y(t))/step;
d2fx = @(t) (dfx(t+step)-dfx(t))/step;
d2fy = @(t) (dfy(t+step)-dfy(t))/step;

fig = figure();
axis equal;
axis([0, 100, -50, 50]);
hold on;
grid on
u = -pi:step:pi;
plot(x(u),y(u),'color','blue')
for h = u
  multiplier = (dfx(h)^2 + dfy(h)^2)/(dfx(h)*d2fy(h) - d2fx(h)*dfy(h));
  X = x(h) - dfy(h) * multiplier;
  Y = y(h) + dfx(h) * multiplier;
  plot(X,Y,'color','red');
  drawnow
endfor
