clear all;
close all;


m_train = load("-ascii", "iris_data_norm_train.txt");

m_test = load("-ascii", "iris_data_norm_test.txt");

[w, no_of_iterations, Ein] = training_pla(m_train);

printf("-------------------------------------------------------\n");
printf("Machine has completed learning,\n");
printf("from the given dataset.\n");
printf("So, weights obtained - \n");

w

[misclassifications, classifications] = testing_pla(m_test,w);

printf("-------------------------------------------------------\n");
misclassifications
classifications
printf("Accuracy = %f \n", (100*classifications)/(misclassifications + classifications));
printf("-------------------------------------------------------\n");

m_both = load("-ascii", "iris_data_norm_both.txt");

plotting_datapoints(m_both);

% CS308: Introduction to Artificial Intelligence - Lab#02
% Question #01
% Author: Rahul Nalawade
% Roll No: 201351017
