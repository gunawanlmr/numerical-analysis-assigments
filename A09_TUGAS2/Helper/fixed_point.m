function [x, error, iter, time, diff, result, TOL] = fixed_point(f, g, TOL = 10^-5)
  % fprintf('    i           g(x)\n')
  % fprintf('-----------  -----------\n')
  
  time = cputime;
  list = zeros(1, 1);
  
  % initialize value of error, convergent, and iteration
  
  error = 1;
  diff = 10^5;
  i = 1;
  
  while (diff > TOL && i < 1000)
    list(i + 1) = g(x(i)); % update x using g
    diff = abs(x(i + 1) - list(i));
    fprintf('%12.0f %12.8f\n', i, list(i + 1));
    i += 1;
  endwhile
  
  x = list(i);
  time = cputime - time;
  result = f(x);
end