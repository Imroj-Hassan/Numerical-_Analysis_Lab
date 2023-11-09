% Prompt the user to enter matrix A and matrix B
A = input('Enter matrix A: ');
B = input('Enter matrix B: ');

% Check if both matrices are compatible for multiplication
if size(A, 2) == size(B, 1)
    % Perform matrix multiplication
    C = A * B;

    % Display the result
    fprintf('The product of matrices A and B is:\n');
    disp(C);
else
    fprintf('Matrix multiplication is not possible due to incompatible dimensions.\n');
end

% Find and print the maximum value in matrix A
max_val = max(A(:));
fprintf('The maximum value in matrix A is: %d\n', max_val);

