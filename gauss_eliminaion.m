clc;
disp('bX = c');

% Get the size of the matrix from the user
n = input('Enter the size of the matrix: ');

% Get the matrix 'b' from the user
b = input('Enter the elements of the matrix b: ');

% Get the vector 'c' from the user
c = input('Enter the elements of the matrix c: ');

% Calculate the determinant of matrix 'b'
det_b = det(b);

% Check if the system is solvable
if det_b == 0
    disp('This system is unsolvable because det(b) = 0');
else
    % Augment matrix 'b' with vector 'c'
    augmented_matrix = [b c];

    % Forward elimination to convert to upper triangular matrix
    for i = 1:n-1
        for j = i+1:n
            factor = augmented_matrix(j, i ) / augmented_matrix(i, i);
            augmented_matrix(j, i:n+1) = augmented_matrix(j, i:n+1) - factor * augmented_matrix(i, i:n+1);
            disp(augmented_matrix); % Display intermediate steps (optional)
            fprintf('\n');
        end
    end

    % Initialize solution vector
    X = zeros(n, 1);

    % Back substitution to solve for X
    for i = n:-1:1
        X(i) = (augmented_matrix(i, end) - sum(augmented_matrix(i, i+1:n) .* X(i+1:n))) / augmented_matrix(i, i);
    end

    % Display the solution vector X
    disp('The solution vector X is:');
    disp(X);
end
