clc;
pkg load symbolic;

% Prompt the user to enter an equation in terms of x
eq = input('Enter an equation (in terms of x): ', 's');
f = str2func(['@(x) ', eq]);
syms x;
ff = diff(f(x), x);
k = matlabFunction(ff);

% Prompt the user to enter tolerance and maximum iterations
tol = input('Enter tolerance: ');
max_iterations = 30;
results = [];
tangent_lines = [];

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

c = (a + b) / 2;

% Root calculation using the Newton-Raphson method
for i = 1:max_iterations
    f_c = f(c);
    k_c = k(c);
    results = [results, c];

    % Store tangent line data (x, y) for visualization
    tangent_lines = [tangent_lines; [c, f_c]];

    d = c - (f_c / k_c);
    if abs(d - c) <= tol
        break;
    end
    c = d;
end

fprintf('Root is %0.4f\n', c);
disp('Calculated roots in each iteration:');
disp(results);

% Graph visualization with tangent lines
x = 0:0.1:10;
hold on;
plot(x, f(x));
plot(results, f(results), 'xr');
title([eq, ' = 0']);
titleFontSize = 16;
set(get(gca, 'title'), 'FontSize', titleFontSize);
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'XAxisLocation', 'origin');

% Bonus: Draw tangent lines at each iteration
for i = 1:length(tangent_lines)
    x_val = tangent_lines(i, 1);
    y_val = tangent_lines(i, 2);

    % Calculate tangent line slope (k_c)
    k_val = k(x_val);

    % Generate points for tangent line
    tangent_x = linspace(x_val - 1, x_val + 1, 100);
    tangent_y = y_val + k_val * (tangent_x - x_val);

    plot(tangent_x, tangent_y, '--', 'Color', [0.5 0.5 0.5]);
end
