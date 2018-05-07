function out = fc(x, arg = 'f')
  n = length(x);
  
  if index(arg, 'f') > 0
    s = sum(x .^ 2) / 4000;
    m = cos(x ./ sqrt(1:n));
    f = 1 + s - prod(m);
    out = f;
  endif
  
  if index(arg, 'g') > 0
    g = ones(n, 1);
    pr = prod(cos(x ./ sqrt(1:n)'));
    for i=1:n
      p = pr / cos(x(i) ./ sqrt(i));
      g(i) = (2*x(i)/4000) + ( sin(x(i)/sqrt(i))*p /sqrt(i) );
    endfor
    out = g;
  endif
  
  if index(arg, 'h') > 0
    h = eye(n);
    pr = prod(cos(x ./ sqrt(1:n)'));
    for i=1:n
      p = pr / cos(x(i) ./ sqrt(i));
      for j=1:n
        if i ~= j
          p = p / (cos(x(j)/sqrt(j)));
          h(i, j) = - ( sin(x(i)/sqrt(i))*sin(x(j)/sqrt(j))*p / (sqrt(i)*sqrt(j)) );
        else
          h(i, j) = (2/4000) + ( cos(x(i)/sqrt(i))*p /i );
        endif
      endfor
    endfor
    out = h;
  endif
endfunction