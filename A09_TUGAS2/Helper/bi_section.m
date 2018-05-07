function [x, iter, error, time, diff, result, TOL] = bi_section(a, b, f, TOL = 10^-6)
  
  % initialize error, iter, time
  error = 10^6;
  iter = 0;
  time = cputime;
  mp = 10^6;
  
  % fprintf('    a             f(a)        b           f(b)\n')
  % fprintf('-----------  -----------  ---------    ----------\n')
  while (abs(b-a) > TOL && error > TOL)
    m = (a + b) / 2;
    if (f(m) * f(a) > 0)
      a = m;
    else
      b = m;
    endif
    % fprintf('%12.8f %12.8f %12.8f %12.8f\n', a, f(a), b, f(b))
    error = abs(f(m));
    iter += 1;
  endwhile
  x = m;
  diff = abs(b - a);
  result = f(m);
  time = cputime - time;
end