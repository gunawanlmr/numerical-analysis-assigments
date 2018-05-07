function out = fb(x, arg = 'f')
  r = x(1);
  t = x(2);
  lambda = x(3);
  
  if index(arg, 'f') > 0
    % f = 2*pi*r*(r + t) + lambda*(pi*(r^2)*t - 400);
    f = 2*pi*(r^2) + 2*pi*r*t + lambda*pi*(r^2)*t - lambda*400;
    out = f;
  endif
  
  if index(arg, 'g') > 0
    g = [
          4*pi*r + 2*pi*t + 2*lambda*pi*r*t;
          2*pi*r + lambda*pi*(r^2);
          pi*(r^2)*t - 400
        ];
    out = g;
  endif
  
  if index(arg, 'h') > 0
    h = [
          4*pi + 2*lambda*pi*t, 2*pi + 2*lambda*pi*r, 2*pi*r*t;
          2*pi + 2*lambda*pi*r, 0, pi*(r^2);
          2*pi*r*t, pi*(r^2), 0
        ];
    out = h;
  endif
endfunction