clc;

% Prompt the user to enter an equation in terms of x
eq = input('Enter an equation (in terms of x): ', 's');
f = str2func(['@(x) ', eq]);

% Prompt the user to enter tolerance and maximum iterations
tol = input('Enter tolerance: ');
max_iterations = 30;
results = [];

% Root calculation
for i = 1:5
    % Prompt the user to enter the first and second intervals
    a = input('Enter the first interval: ');
    b = input('Enter the second interval: ');

    % Check if there is a change of sign in the interval
    if f(a) * f(b) < 0
        break;
    else
        fprintf('No root between the given intervals.\n');
    end
end

for i = 1:max_iterations
    c = (a + b) / 2;
    results = [c, results];

    % Check if the difference between c and b or c and a is within tolerance
    if abs(c - b) < tol || abs(c - a) < tol
        break;
    end

    if f(a) * f(c) < 0
        b = c;
    elseif f(b) * f(c) < 0
        a = c;
    end
end

fprintf('Root is %0.4f\n', c);
disp('Calculated roots in each iteration:');
disp(results');

% Graph visualization
x = 0:0.1:10;
hold on;
plot(x, f(x));
plot(c, f(c), 'xr');
title([eq, ' = 0']);
titleFontSize = 16;
set(get(gca, 'title'), 'FontSize', titleFontSize);
xlabel('X');
ylabel('Y');
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'XAxisLocation', 'origin');

