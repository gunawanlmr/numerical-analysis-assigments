function result = runTestAndGetResult(A, b)
  start_time = cputime;
  result = [];
  n = size(A, 2);
  for i=1:3
    current_time = cputime - start_time;
    printf("Process: %d (%.2f) \n", i, current_time);
    m = size(A{i}, 1);
    [x, iter, runtime, w, error] = sor3(A{i}, b{i});
    result = vertcat(result, [m iter runtime w error]);
  endfor
  csvwrite('result2.csv', result);
end