clc;
% Runge-Kutta Method in MATLAB with User Input (using x and y)

% Define the function
func_str = input('Enter the function f(x,y) (e.g. x + y): ', 's');
f = str2func(['@(x,y)',func_str]);

% Initial conditions
x0 = input('Enter initial value x0: ');
y0 = input('Enter initial value y0: ');

% Step size
h = input('Enter the step size h: ');

% Number of steps
n = input('Enter the number of steps: ');

% Arrays to store solutions
x = zeros(1, n+1);
y = zeros(1, n+1);

% Initial values
x(1) = x0;
y(1) = y0;

% Runge-Kutta 4th order method
for i = 1:n
    k1 = h * f(x(i), y(i));
    k2 = h * f(x(i) + 0.5 * h, y(i) + 0.5 * k1);
    k3 = h * f(x(i) + 0.5 * h, y(i) + 0.5 * k2);
    k4 = h * f(x(i) + h, y(i) + k3);
    
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
end

% Display results
fprintf('x = \n');
disp(x);
fprintf('y = \n');
disp(y);

% Plot results
plot(x, y, '-o');
title('Runge-Kutta Method');
xlabel('x');
ylabel('y');
grid on;
