function [A, b] = generateTestCase()
  test_size_list =  {5, 10, 50, 100, 500, 1000, 1500, 2000, 2500, 3000};
  n = size(test_size_list, 2);
  A = {};
  b = {};
  for i=1:n
    [A1, b1] = generateSPDmatrix(test_size_list{i});
    A{i} = A1;
    b{i} = b1;
  endfor
end