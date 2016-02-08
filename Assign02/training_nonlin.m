function W = training_nonlin(M)

% trainig_momlin(matrix) trains on the data given in the form of matrix
% using NON LINEAR REGRESSION for degree = 2
%
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% produces hypothesis weights w = {w1, w2, . . ., wN}

[len, A] = size(M);
A--;

Max = A*(A+1)/2;

x(1:len,1) = ones(len,1);		

for i=2:A+1
	x(1:len,i) = M(1:len,i-1);
end

for i=6:9
	x(1:len,i) = M(1:len,(i-5)) .* M(1:len,(i-5));
end

x(1:len,10) = M(1:len,1) .* M(1:len,2);
x(1:len,11) = M(1:len,2) .* M(1:len,3);
x(1:len,12) = M(1:len,3) .* M(1:len,4);
x(1:len,13) = M(1:len,1) .* M(1:len,3);
x(1:len,14) = M(1:len,2) .* M(1:len,4);
x(1:len,15) = M(1:len,1) .* M(1:len,4);


T = M(1:len,A+1);

w = pinv(x)*T;
W = w;

% CS308: Introduction to Artificial Intelligence - Lab#02
% Author: Rahul Nalawade
% Roll No: 201351017
