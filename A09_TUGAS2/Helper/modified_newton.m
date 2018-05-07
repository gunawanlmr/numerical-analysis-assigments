function [x, iter, error, time] = newton(xo, f, fp, fpp, TOL = 10^-5)
  time = cputime;
  i = 1;
  error = 10^6;
  diff = 10^6;
  
  x = zeros(1);
  x(1) = xo;
  
  while(i < 1000 && diff > TOL && f(x(i)) != 0) % limit iteration to 1000
    x(i + 1) =  x(i) - f(x(i))*fp(x(i)) / ((fp(x(i)))^2 - f(x(i))*fpp(x(i)));
    diff = abs(x(i + 1) - x(i));
    i += 1;
  endwhile

  x = x(i);
  time = cputime - time;
  iter = i;
  error = diff;
end