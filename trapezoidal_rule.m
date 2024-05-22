function integral = trapezoidal_rules(func, range, step_size)
    % Extract the start and end points from the range
    a = range(1);
    b = range(2);
    
    % Create an array of x values from a to b with the specified step size
    x = a:step_size:b;
    
    % Evaluate the function at the x values
    y = func(x);
    
    % Apply the trapezoidal rule formula
    integral = step_size * (sum(y) - (y(1) + y(end))/2);
end

clc;
% Define the function to integrate
func_str = input('Enter the function to integrate: ', 's');
func = str2func(['@(x) ', func_str]);
% Define the range [a, b]
a = input('Enter the start of the range: ');
b = input('Enter the end of the range: ');
range = [a, b];

% Define the step size
step_size = input("Enter the step size:");

% Call the trapezoidal rule function
result = trapezoidal_rules(func, range, step_size);

% Display the result
disp(['The integral is: ', num2str(result)]);
