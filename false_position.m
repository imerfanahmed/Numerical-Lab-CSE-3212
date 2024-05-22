% Clearing Screen
clc

% Setting x as symbolic variable
syms x;

% Input Section
y = input('Enter non-linear equation: ', 's');
y = str2func(['@(x)' y]);
a = input('Enter first guess: ');
b = input('Enter second guess: ');
e = input('Tolerable error: ');

% Finding Functional Value
fa = y(a);
fb = y(b);

% Implementing False Position Method
if fa*fb > 0 
    disp('Given initial values do not bracket the root.');
else
     c = a - (fa * (b - a)) / (fb - fa);
    fc = y(c);
    fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n');
    while abs(fc)>e
        fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
        if fa*fc < 0
            b = c;
            fb = y(b); % Update the value of fb
        else
            a = c;
            fa = y(a); % Update the value of fa
        end
        c = a - (fa * (b - a)) / (fb - fa);
        
        fc = y(c);
    end
    fprintf('\nRoot is: %f\n', c);
end
