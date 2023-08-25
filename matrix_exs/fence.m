function res=fence(r,varargin)
  c = r;
  if nargin>1
    c = varargin{1};
  endif
  oness = ones(1,r);
  A = zeros(r,c);
  for i=1:2:c
    A(1:r,i) = oness;
  endfor
  res=logical(A)
endfunction
