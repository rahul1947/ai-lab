clear all;
close all;


m_train = load("-ascii", "iris_data_norm_train.txt");


w = training_linreg(m_train)

m_test = load("-ascii","iris_data_norm_test.txt");

printf("-------------------------------------------------------\n");
[misclassifications, classifications] = testing_pla(m_test, w)

printf("Accuracy = %f \n", (100*classifications)/(misclassifications + classifications));
printf("-------------------------------------------------------\n");

% CS308: Introduction to Artificial Intelligence - Lab#02
% Question #05
% Author: Rahul Nalawade
% Roll No: 201351017
