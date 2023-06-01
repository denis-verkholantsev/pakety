function res=checkerboard(r, varargin)
  c = r;
  if nargin > 1
    c = varargin{1};
  endif
  A = zeros(r,c);
  num = 1;
  even_c = !mod(c,2)
  for i=1:r
    for j=1:c
      A(i,j) = num;
      num += 1;
    endfor
    if even_c
      num += 1;
    endif
  endfor
  res = logical(mod(A,2));
endfunction

##function res=checkboard(r, varargin)
##  c = r;
##  if nargin > 1
##    c = varargin{1};
##  endif
##   vec = zeros(1,c)
##   for i=1:2:c
##    vec(1,i) = 1;
##   endfor
##   A = zeros(r,c)
##   for i=1:r
##     if mod(i,2) == 0
##      A(i,2:c) = vec(1,1:c-1);
##     else
##      A(i,1:c) = vec(1,1:c);
##     endif
##   endfor
##   res = A
##endfunction
