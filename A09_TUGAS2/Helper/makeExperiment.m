function x = makeExperiment(list_x, list_tol, list_f, list_fp, list_fpp)
  result = [];
  for i=1:size(list_tol, 2)
    for j = 1:size(list_x, 2)
      for k = 1:size(list_f, 2)
        [x, iter, error, time] = modified_newton(list_x(j), list_f{k}, list_fp{k}, list_fpp{k}, list_tol(i));
        result = vertcat(result, [list_tol(i) list_x(j) x iter error time]);
      end
    end
  end
  csvwrite('result.csv', result);
end