function E_IN = gradient_des(M,weights)

% gradient_des(matrix,weight_matrix) computes the in sample error - Ein using
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% w = Matrix containing improvised weight vectors  
% produces Ein corresponding to each weight vector from w

[N A] = size(M);

A--;

X = ones(N,1);
X = [X M(1:N,1:A)];
T = M(1:N,A+1);

P = length(weights);

for t=1:P
	
	w = weights(t,1:A+1);
	
	for i=1:N
	
		E(i) = log(1 + exp(-1*T(i)*w*transpose(X(i,1:A+1))));
		
	end
	
	Ein(t) = (1/N)*sum(E);
	
end

E_IN = Ein;

% CS308: Introduction to Artificial Intelligence - Lab#03
% Author: Rahul Nalawade
% Roll No: 201351017
