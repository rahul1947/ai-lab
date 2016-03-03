clear all;
close all;

M = load('-ascii', 'ex2data2.txt');

[N A] = size(M);
A--;

iterations = 150;

weights = logistic_reg(M, iterations);

Ein = gradient_des(M,weights);

plot(Ein);
hold on
grid on
xlabel('Iterations');
ylabel('Ein');

title('In sample error - Ein(w)');
print('Ein - Gradient Descent.png','-dpng');
hold off

l = length(weights);

G = weights(l,1:A+1);

plotting_cp(M,G);

% CS308: Introduction to Artificial Intelligence - Lab#03
% Author: Rahul Nalawade
% Roll No: 201351017
