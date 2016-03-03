function W = logistic_reg(M,Q)

% logistic_reg(matrix,Q) trains on the data given in the form of matrix
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% Q = No of training iterations for w(t) where t = {1, 2, 3, ..., Q} 
% produces hypothesis weights matrix where W = [w(1); w(2); w(3); ...; w(Q)] and
% w(t) = {w0, w1, w2, . . ., wN} matrix for each t

[N, A] = size(M);
A--;

X = ones(N,1);
X = [X M(1:N,1:A)];
T = M(1:N,A+1);

t = 1;

g = 0.1;

w(t,1:A+1) = rand(1,A+1);

for t=1:Q

	for i=1:N
		E(i,1:A+1) = (T(i)*X(i,1:A+1)) / (1 + exp(T(i)*w(t,1:A+1)*transpose(X(i,1:A+1))));
	end

	d_Ein(t,1:A+1) = (-1/N)*sum(E);
	
	w(t+1,1:A+1) = w(t,1:A+1) - g*d_Ein(t,1:A+1);
end
W = w;

% CS308: Introduction to Artificial Intelligence - Lab#03
% Author: Rahul Nalawade
% Roll No: 201351017
