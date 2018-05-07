function [x, i, error, time] = fixed_point(x0, f, g, TOL = 10^-12)
  % fprintf('    i           g(x)\n')
  % fprintf('-----------  -----------\n')
  
  tic;
  
  xs = zeros(1, 1);
  xs(1) = x0;
  
  diff = TOL + 1;
  i = 1;
  
  while (diff > TOL && i < 1000)
    xs(i + 1) = g(xs(i)); % update x using g
    diff = abs(xs(i + 1) - xs(i));
    % fprintf('%12.0f %12.8f\n', i, xs(i + 1));
    i += 1;
  endwhile
  
  x = xs(i);
  error = abs(f(x));
  
  time = toc;
endfunction