%% Clearing any previous data
clc;
clear;
format compact;
close all;

%% Input the function to integrate
func_str = input('Enter the function to integrate in terms of x: ', 's');
func = str2func(['@(x) ', func_str]);

%% Input the limits of integration and the number of intervals
a = input('Enter the lower limit of integration: ');
b = input('Enter the upper limit of integration: ');
n = input('Enter the number of intervals (must be even): ');

% Ensure the number of intervals is even
if mod(n, 2) ~= 0
    error('Number of intervals must be even');
end

%% Calculate the step size
h = (b - a) / n;

%% Initialize the sum
sum = func(a) + func(b);

%% Apply Simpson's 1/3 Rule
for i = 1:2:n-1
    sum = sum + 4 * func(a + i * h);
end

for i = 2:2:n-2
    sum = sum + 2 * func(a + i * h);
end

integral = (h / 3) * sum;

%% Display the result
fprintf('The approximate value of the integral is: %.6f\n', integral);
