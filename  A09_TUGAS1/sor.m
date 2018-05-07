function [x, iter, runtime, w, error] = sor(A, b, w = 1, max_it=1000, tol = 10^-6)
% [x, iter]  = sor(A, x, b, w, max_it, tol)
%
% sor.m solves the linear system Ax=b using the 
% Successive Over-Relaxation Method (Gauss-Seidel method when omega = 1 ).
%
% input   A        REAL matrix
%         b        REAL right hand side vector
%         w        REAL relaxation number
%         max_it   INTEGER maximum number of iterations
%         tol      REAL error tolerance
%
% output  x        REAL solution vector
%         iter     INTEGER number of iterations performed

t = cputime;
[n, m] = size(A);

%w = 2 / (1 + sin(pi* (1 / (n + 1))));

if m != n
  disp("Matrix input should be Square Matrix")
endif
if !all( sum(diag(A)) >= sum(max(A),2)) || (issymmetric(A) && all(eig(A) > eps))
  disp("Matrix input should be Strictly Diagonally Dominance or Symmetric Definit Positive to be convergen")
endif

x = zeros(n, 1);  
 
for i=1:1000
    sum = A(j, 1:j-1) * x(1:j-1, size(x, 2)) + A(j, j+1:n) * x(j+1:n, i);
  for j = 1:n
    x(:, i) = ( 1 - w ) * x(ind, i)  + (w / A(i,i)) * ( b(i) - A(i,ind) * x(ind, i));
  endfor
  error = norm(b - A*x(:,i)) / norm(b); % calculate relative error
  if norm(x(:, i + 1) - x(:, i)) < tol && error < 0.1
    break;
  endif
endfor

printf('Total cpu time: %f seconds\n', cputime-t);
runtime = cputime - t;
x = x(:, i);
iter = i;
error = norm(b - A*x) / norm(b);