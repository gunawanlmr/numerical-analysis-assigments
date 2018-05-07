function [M, b] = symmetricGenerator(n)
M = rand(n,n);
M = 0.5*(M+M');
M = M + eye(n);
b = n*rand(n,1);
end