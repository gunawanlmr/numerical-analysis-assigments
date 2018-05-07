function [L,A, p] = bandedMatrixLUPivoting(A)
  [n,n] = size(A);
  L = eye(n);
  p = 1:n;
  
  %loop luar utk kolom, loop dalemnya untuk baris
  for k = 1:n-1
    %lakukan pivoting untuk mencegah division by zeros untuk satu kolom
    % v max value idx index pivot
    [v, idx] =  max(abs(A(k:n, k)));
    if v == 0
      quit;
    end
    utemp = A(k, :);
    ptemp = p(k);
    A(k, :) = A(idx, :); %nuker u
    p(k) = p(idx); %nuker baris diagonbal dgn yg max
    A(idx, :) = utemp;
    p(idx) = ptemp; %yg index dituker sama yg k
    for i = k+1:n
      L(i,k) = A(i,k)/A(k,k);
      for j = k:n
        A(i,j) = A(i,j) - L(i,k) * A(k,j);
      endfor
    endfor
  endfor
  U = A;
endfunction