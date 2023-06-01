
clear
f = @(x) (1 + (1+sin(x)-cos(x))^2-(sin(2*x)-cos(2*x)-0.2)^2);

vec_x = -3:0.01:3;
x_0 = [];
n=1;

#вектор пар иксов слева и справа от f(x)=0
for i = 1:length(vec_x)-1
  if (sign(f(vec_x(1,i)))!= sign(f(vec_x(1,i+1))))
    x_0(n,1) = vec_x(1,i);
    x_0(n,2) = vec_x(1,i+1);
    n=n+1;
  endif
endfor

#метод половинного деления
#график
y = [];
for i=1:length(vec_x)
  y(1,i) = f(vec_x(1,i));
endfor
figure('numbertitle','off','name','method of dividing a line segment in half');
plot(vec_x, y, 'color','red')
hold on
grid on
#иксы
for i = 1:n-1
  x_l = x_0(i,1);
  x_r = x_0(i,2);
  while ( abs(x_l-x_r) > 0.000001)
    x_k = (x_r + x_l)/2;
    if ((sign(f(x_k))!= sign(f(x_l))))
      x_r = x_k;
    else
      x_l = x_k;
    endif
  endwhile
  plot(x_k, f(x_k),'color','blue')
  res(1,i) = x_k;
endfor



# метод ньютона
figure('numbertitle','off','name','method of nuton');
plot(vec_x, y, 'color','red')
hold on
grid on
step=0.001;
dfx = @(x) (f(x+step)-f(x))/step;
for i = 1:n-1
  x_n = x_0(i,1);
  x_k = tmp = 0;
  while ( abs(x_n-tmp) > 0.00000001)
    f_ = dfx(x_n)
    x_k = x_n - f(x_n)/f_;
    tmp = x_n
    x_n = x_k
    # касательные для каждого x_n -> x_0
    line =  @(x) f_*(x - tmp) + f(tmp);
    plot(vec_x, line(vec_x));
  endwhile
  plot(x_n, f(x_n),'color','blue')
endfor




