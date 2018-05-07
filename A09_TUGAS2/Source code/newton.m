function [x, iter, diff, time] = newton(x0, f ,fp ,tol)
  t0 = clock();
  i = 1;
  x(1) = x0;
  diff = 10^6;
  
  while(i < 1000 && diff > tol && x != 0 && fp(x(i)) != 0)
    x(i+1) = x(i) - (f(x(i))/fp(x(i)));
    diff = abs(x(i+1) - x(i));
    i = i+1;
  endwhile
  
  x = x(i);
  iter = i;
  time = etime(clock(), t0);
end