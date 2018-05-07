function [x] = householderSolver(A, b)
  [Q, R] = householder(A);
  [m, n] = size(A);
  Qb = Q'*b;
  
  x(m) = Qb(m) / R(m, n);
  
  for i=m-1:-1:1
    sum = 0;
    for j=n:-1:i+1
      sum = sum + (R(i, j) * x(j));
    end
    x(i) = (Qb(i) - sum) / (R(i, n));
  end
endfunction