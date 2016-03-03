function [E,C] = testing_pla(M,w)

% testing_pla(matrix) tests on the data given in the form of matrix
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% w = [w1 w2 . . . wN];
% produce E, percentage misclassifications

[len, A] = size(M);

A--;

X = [M(1:len,1:A)];

T = [M(1:len,A+1)];

err = 0;
corr = 0;

for i = 1:len
	
	x = transpose([X(i,1:A)]);
	
	product = w * x;
	
	if((product < 0 && T(i) == 1) || (product > 0 && T(i) == -1))
		err++;
	else
		corr++;
	end
end

E = err;
C = corr;

endfunction

% CS308: Introduction to Artificial Intelligence - Lab#02
% Author: Rahul Nalawade
% Roll No: 201351017
