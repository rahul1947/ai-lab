function [W,ITERATIONS,E] = training_pocket(M)

% trainig_pocket(matrix) trains on the data given in the form of matrix
% using POCKET ALGORITHM
% M = [attribute1 attribute2 . . . attributeN targetFunction];

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
		
		if(iterations == 1)
			w_it(iterations,1:A) = w;
			errors(iterations) = improvements;
			
		elseif(iterations > 1 && errors(iterations-1) < errors(iterations) )	% Condition of POCKET ALGORITHM
			w_it(iterations,1:A) = w_it(iterations - 1,1:A);
			errors(iterations) = errors(iterations - 1);	
		else
			w_it(iterations,1:A) = w;
			errors(iterations) = improvements;
		end
	end
	
	if(i == len && improvements > 0)
		iterations++;
		errors(iterations) = improvements;
		
		if(iterations >= 2 && errors(iterations - 1) < errors(iterations) )		% Condition of POCKET ALGORITHM
			w_it(iterations,1:A) = w_it(iterations - 1,1:A);
			errors(iterations) = errors(iterations - 1);
		else
			w_it(iterations,1:A) = w;
			errors(iterations) = improvements;
		end
		i = 0;
		improvements = 0;		% restarting the iterations
	end
	
	if(iterations == 1000)
		break;
	end
	
end

W = w_it;
ITERATIONS = iterations;
E = errors;
endfunction

% CS308: Introduction to Artificial Intelligence - Lab#02
% Author: Rahul Nalawade
% Roll No: 201351017
