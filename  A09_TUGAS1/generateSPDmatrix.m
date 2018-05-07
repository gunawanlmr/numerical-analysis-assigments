function [A, b] = generateSPDmatrix(n)
% Generate a dense n x n symmetric, positive definite matrix

A = unidrnd(6, n); % generate a random n x n matrix

% construct a symmetric matrix using either
A = A*A';
% The first is significantly faster: O(n^2) compared to O(n^3)

% since A(i,j) < 1 by construction and a symmetric diagonally dominant matrix
%   is symmetric positive definite, which can be ensured by adding nI
A = A + n*eye(n);

b = unidrnd(100, n, 1);
end