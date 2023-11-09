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
    results = [c, results];
    d = c - (f_c / k_c);
    if abs(d - c) <= tol
        break;
    end
    c = d;
end

fprintf('Root is %0.4f\n', c);
disp('Calculated roots in each iteration:');
disp(results);

% Graph visualization
x = 0:0.1:10;
hold on;
plot(x, f(x));
plot(c, f(c), 'xr');
title([eq, ' = 0']);
titleFontSize = 16;
set(get(gca, 'title'), 'FontSize', titleFontSize);
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'XAxisLocation', 'origin');

