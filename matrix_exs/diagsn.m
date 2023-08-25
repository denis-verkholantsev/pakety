function A = diagsn(n, varargin)
  m = n
  if nargin > 1
    m = varargin{1}
  endif
  A = zeros(n, m, 'uint32');
  num = 1;
  for i = 1:(n+m-1)
    if mod(i,2) == 0
      if i <= n
        rows = i;
        cols = 1;
      else
        rows = n;
        cols = i - n + 1;
      endif
      while rows >= 1 && cols <= m
        A(rows, cols) = num;
        num = num + 1;
        rows = rows - 1;
        cols = cols + 1;
      endwhile
     else
      if i <= m
        rows = 1;
        cols = i;
      else
        rows = i - m + 1;
        cols = m;
      endif
      while cols >= 1 && rows <= n
        A(rows, cols) = num;
        num = num + 1;
        rows = rows + 1;
        cols = cols - 1;
      endwhile
     endif
  endfor
endfunction
