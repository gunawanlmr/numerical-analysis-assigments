function [x, iter, time, diff] = newton(xo, f, fp, TOL = 10^-5)
  time = cputime;
  i = 1;
  error = 10^6;
  diff = 10^6;
  
  x = zeros(1);
  x(1) = xo;
  
  while(i < 1000 && diff > TOL && f(x(i)) != 0) % limit iteration to 1000
    x(i + 1) =  x(i) - f(x(i)) / fp(x(i));
    diff = abs(x(i + 1) - x(i));
    i += 1;
  endwhile

  x = x(i);
  time = cputime - time;
  iter = i;
end