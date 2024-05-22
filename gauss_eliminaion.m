clc;
disp('bX = c')
%4
n = input('Enter the size of matrix');
%[2 1 -1 2; 4 5 -3 6; -2 5 -2 6; 4 11 -4 8]
b = input('Enter the elements of the Matrix b ' );
%[5;9;4;2]
c = input('Enter the elements of the Matrix c ' );
dett = det(b);
if dett == 0
    disp('This system unsolvable because det(b) = 0 ')
else
    a=[b c];
    for i = 0:n-2
        for j = 0:n-2-i
            a(i+j+2:i+j+2,i+1:n+1)=(a(i+j+2:i+j+2,i+1:n+1).*(a(i+1,i+1)/a(i+j+2,i+1)))-a(i+1:i+1,i+1:n+1);
            disp(a)
            fprintf('\n');
        end
    end
    X=c';
    for i = 0:n-1
        X(n-i)=(a(n-i,n+1)-sum(a(n-i:n-i,1:n).*X)+a(n-i,n-i)*X(n-i))/a(n-i,n-i);
    end
    X=X';
    disp(X)
end