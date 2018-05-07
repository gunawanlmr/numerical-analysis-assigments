function y = fc_input(n)
  y = 1:n;
  for i=1:n
    if mod(i, 4) == 1
      y(i) = -400;
    elseif mod(i, 4) == 2
      y(i) = -200;
    elseif mod(i, 4) == 3
      y(i) = 200;
    elseif mod(i, 4) == 0
      y(i) = 400;
    endif
  endfor
endfunction