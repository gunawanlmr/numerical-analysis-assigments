function [x, error, iter, time, tol] = bisection(a,b,f,TOL = 10^-12)
  
  % init error, iter, time, m = mean
  error = 10^6;
  iter = 0;
  time = cputime;
  m = 0;
  
  % init f(a) and f(b)
  fa = f(a);
  fb = f(b);
  
  % check if f(a)*f(b) < 0
  if(fa * fb > 0)
    disp('Function has same sign at both endpoints.')
  endif
  
  % loop until b-a > tol
  while (abs(b - a) > TOL)
    % find the middle point of the interval
    m = (a + b) / 2;
    fm = f(m);
    % move the interval, so it becomes closer to the root
    if (fa * fm > 0)  
      a = m;
    else
      b = m;
    endif  
    iter++;
  endwhile
  % output : root (x), error, num of iteration, running time
  disp('-----------------------------------------')
  disp('                 output')
  disp('-----------------------------------------')
  
  x = m;
  result = f(m);
  error = abs(f(m))
  iter
  time = cputime - time
  endfunction