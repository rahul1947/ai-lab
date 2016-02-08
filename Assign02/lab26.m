clear all;
close all;


m_train = load("-ascii", "iris_data_norm_train.txt");

printf("The weight vector for II order non-linear regression:\n");

w = training_nonlin(m_train)

printf("--------------------------------------------------\n");

% CS308: Introduction to Artificial Intelligence - Lab#02
% Question #06
% Author: Rahul Nalawade
% Roll No: 201351017
