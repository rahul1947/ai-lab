function W = gradient_des(M)

% gradient_des(matrix) trains on the data given in the form of matrix
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% produces hypothesis weights w = {w1, w2, . . ., wN}

[len, A] = size(M);
A--;

X = M(1:len,1:A);
T = M(1:len,A+1);

w(1:A) = rand();

iterations = 0;
improvements = 0;
i = 0;

while(i < len)

	i++;
	
	x = transpose(X(i,1:A));
	
	product = w * x;
	
	if((product < 0 && T(i) == 1) || (product > 0 && T(i) == -1))
		improvements++;
		w = w + T(i)* x';	% w <- w + yx
	end
	
	if (i == len && improvements == 0)	% last iteration
		iterations++;
		errors(iterations) = improvements;
	end
	
	if(i == len && improvements > 0)
		i = 0;
		iterations++;
		errors(iterations) = improvements;
		improvements = 0;		% restarting the iterations
	end
	
end

W = w;
ITERATIONS = iterations;
E = errors;
endfunction

% CS308: Introduction to Artificial Intelligence - Lab#02
% Author: Rahul Nalawade
% Roll No: 201351017
