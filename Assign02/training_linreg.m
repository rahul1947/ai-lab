function W = training_linreg(M)

% trainig_linreg(matrix) trains on the data given in the form of matrix
% using LINEAR REGRESSION
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% produces hypothesis weights w = {w1, w2, . . ., wN}

[len, A] = size(M);
A--;

X = M(1:len,1:A);
T = M(1:len,A+1);

w = pinv(X)*T;
W = w';

% CS308: Introduction to Artificial Intelligence - Lab#02
% Author: Rahul Nalawade
% Roll No: 201351017
