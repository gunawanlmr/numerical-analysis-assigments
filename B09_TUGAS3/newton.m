function [x, iter, error, time] = newton(f, x0, tol, max_iter = 1000)
  x0 = x0';
  iter = 0;
  tic;
  do
    iter = iter + 1;
    g = f(x0, 'g');
    H = f(x0, 'h');
    v = linsolve(H, -g);
    x1 = x0 + v;
    x = x1;
    x0 = x1;
    error = norm(f(x1, 'g'));
  until(error <= tol || iter == max_iter)
  time = toc;
endfunction