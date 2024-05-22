clc;
a = input('Enter function:', 's');
f = str2func(['@(x)', a]);

x(1) = input('Enter first point of guess interval: ');
x(2) = input('Enter second point of guess interval: ');
n = input('Enter allowed error in calculation: ');
iteration = 0;

fprintf('Iteration\t x(i)\t\t f(x(i))\n');
fprintf('-------------------------------------------\n');

for i = 3:1000
    x(i) = x(i-1) - (f(x(i-1))) * ((x(i-1) - x(i-2)) / (f(x(i-1)) - f(x(i-2))));
    iteration = iteration + 1;
    
    % Display current iteration, x(i), and f(x(i))
    fprintf('%d\t\t %.6f\t %.6f\n', iteration, x(i), f(x(i)));
    
    if abs((x(i) - x(i-1)) / x(i)) * 100 < n
        root = x(i);
        fprintf('\nRoot found: %.6f\n', root);
        fprintf('Total iterations: %d\n', iteration);
        break;
    end
end

if iteration == 1000
    fprintf('The method did not converge within 1000 iterations.\n');
end
