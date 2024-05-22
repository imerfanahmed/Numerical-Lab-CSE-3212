%% Clearing any previous data
clc;
clear;
format compact;
close all;

%% Input the coefficient matrix and the constant vector
A = input('Enter the coefficient matrix A: ');
b = input('Enter the constant vector b: ');

% Ensure A is a square matrix and b is a column vector
[m, n] = size(A);
if m ~= n
    error('Coefficient matrix A must be square');
end
if length(b) ~= n
    error('Constant vector b must have the same number of rows as A');
end

%% Augmented matrix
augmented_matrix = [A b];

%% Forward Elimination
for i = 1:n-1
    for j = i+1:n
        factor = augmented_matrix(j, i) / augmented_matrix(i, i);
        augmented_matrix(j, :) = augmented_matrix(j, :) - factor * augmented_matrix(i, :);
    end
end

disp(augmented_matrix);

%% Back Substitution
x = zeros(n, 1); % Initialize the solution vector
x(n) = augmented_matrix(n, end) / augmented_matrix(n, n);
for i = n-1:-1:1
    x(i) = (augmented_matrix(i, end) - augmented_matrix(i, i+1:n) * x(i+1:n)) / augmented_matrix(i, i);
end

%% Display the result
disp('The solution vector x is: ');
disp(x);