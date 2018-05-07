function x = make_experiment(list_x, list_tol, list_f, list_g)
  result = [];
  for i=1:size(list_f, 2)
    for j = 1:size(list_g(i, :){1}, 2)
      for k = 1:size(list_x, 2)
        for l = 1:size(list_tol, 2)
          [x, iter, error, time] = fixed_point(list_x(k), list_f{i}, list_g{i, 1}{1, j}, list_tol(l));
          result = vertcat(result, [list_x(k) list_tol(l) x iter error time]);
        endfor
      endfor
    endfor
  endfor
  csvwrite('result_fxe-fixed_point.csv', result);
endfunction