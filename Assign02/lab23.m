clear all;
close all;

m_both = load("-ascii", "iris_data_norm_both.txt");

[L, W] = size(m_both);

p = input("Enter the training percentage: ");

N = (p/100)*L;

m_train = m_both(1:N,1:W);

m_test = m_both(N+1:L,1:W);

printf("-------------------------------------------------------\n");
printf("Machine has completed learning,\n");
printf("from the %d%% of the given dataset.\n");
printf("So, weights obtained - \n",p);

[weights, no_of_iterations, Ein] = training_pla_it(m_train);

w=zeros(1,W-1);

for i=1:no_of_iterations
	w = weights(i, 1:(W-1));
	[misclassifications, classifications] = testing_pla(m_test,w);
	Eout(i) = misclassifications;
end

Eout;

weights

Einp = Ein.*(100/N)

Eoutp = Eout.*(100/(L-N))


% plotting the graph
plot(1:no_of_iterations, Einp,'b', 1:no_of_iterations, Eoutp,'r');
grid on;
hold on;
title(strvcat(["Ein and Eout v/s iterations for training ",int2str(p),"% of given dataset"]));
xlabel('epochs');
ylabel('Ein/Eout percentage');
legend('Ein', 'Eout');
print(strvcat(["Ein and Eout ",int2str(p),"%% dataset.png"]), '-dpng');

% CS308: Introduction to Artificial Intelligence - Lab#02
% Question #03
% Author: Rahul Nalawade
% Roll No: 201351017
