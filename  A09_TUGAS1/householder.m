function [Q, A] = householder(A)
  [m, n] = size(A);
  Q = eye(m);
  
  for i = 1:n
    v = A(i:m, i);
    v(1) = v(1) + sign(v(1)) * norm(v);
    
    A(i:m, i:n) = A(i:m, i:n) - ((2 / (v' * v)) * (v * v') * A(i:m, i:n));
    
    Q(:, i:m) = Q(:, i:m) - (Q(:, i:m) * v) * ((2 / (v' * v)) * v');
  endfor
endfunction