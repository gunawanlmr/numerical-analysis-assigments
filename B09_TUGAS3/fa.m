function out = fa(xy, arg = 'f')
  x = xy(1);
  y = xy(2);

  if index(arg, 'f') > 0
    f = 0.5*x^2 + 2.5*y^2;
    out = f;
  endif
  
  if index(arg, 'g') > 0
    g = [x; 5*y];
    out = g;
  endif
  
  if index(arg, 'h') > 0
    h = [1, 0; 0, 5];
    out = h;
  endif
endfunction