clc;
clear;
%% Include all data
% the data must divided to 2 seperated groups : input and target (output).
% The data used for train the ANN to generated the network and function later used for optimization.

load Finalmantap.mat 
troom = Finalmantap(1,:);
rh = Finalmantap(2,:);
drybulb = Finalmantap(3,:);
wetbulb = Finalmantap(4,:);
energi = Finalmantap(5,:);




%% Normalization  [a=1,b=-1]
% In ANN and other data mining approaches we need to normalize the inputs, 
% otherwise the network will be ill-conditioned. In essence, normalization is done 
% to have the same range of values for each of the inputs to the ANN model. 
% This can guarantee stable convergence of weight and biases.
a=1; b=-1;
    input1= ((Finalmantap(1,:)- min(Finalmantap(1,:)))*(a-b)/ (max(Finalmantap(1,:))-min(Finalmantap(1,:))))+b;
    input2= ((Finalmantap(2,:)- min(Finalmantap(2,:)))*(a-b)/ (max(Finalmantap(2,:))-min(Finalmantap(2,:))))+b;
    input3= ((Finalmantap(3,:)- min(Finalmantap(3,:)))*(a-b)/ (max(Finalmantap(3,:))-min(Finalmantap(3,:))))+b;
    input4= ((Finalmantap(4,:)- min(Finalmantap(4,:)))*(a-b)/ (max(Finalmantap(4,:))-min(Finalmantap(4,:))))+b;
    
    
    target1= ((Finalmantap(5,:)- min(Finalmantap(5,:)))*(a-b)/ (max(Finalmantap(5,:))-min(Finalmantap(5,:))))+b;
   
%% Merge normalized input and target
input=[input1;input2;input3;input4];
target=[target1];
  
%% Split data for training and testing
% data split is kinda importance especially for testing the current network
% use 70%-90% of the data for the training and the rest for the testing
% basically the testing data should be different from the training data to
% gain more accuracy.
p=800;            % number of training data (Bisa custom)
u1=input(:,1:p);
u2=input(:,p+1:end);

y1=target(:,1:p);
y2=target(:,p+1:end);

%% ANN Configuration
% this is the design of the ANN the design using bayesian regulation for
% the training function. You can use other such as 

% Levenberg-Marquardt backpropagation 'trainlm'
% BFGS quasi-Newton backpropagation 'trainbfg'
% Gradient descent backpropagation 'traingd'
% and other training/activation function met hod

%designing the network from 1 neuron up to 20 neuron (1 single layer). 
for i=1:10
trainFcn='trainlm';
net{i}=feedforwardnet([i],trainFcn);
net{i} = train (net{i}, u1, y1);

y_train=net{i}(u1);
y_testing=net{i}(u2);

%% Error calculation unnorm
e1{i}=sqrt(mean((y_train(1,:)-y1(1,:)).^2));      % Training
%e2{i}=sqrt(mean((y_train(2,:)-y1(2,:)).^2));  
e3{i}=sqrt(mean((y_testing(1,:)-y2(1,:)).^2));      % Testing
%e4{i}=sqrt(mean((y_testing(2,:)-y2(2,:)).^2));  

end

%% Find a best network according to the lowest error in COP n Cooling 
% find the lowest Root Mean Square Error (RMSE) for the network
e3=cell2mat(e3);
%e4=cell2mat(e4);
err_opt=sqrt(e3.^2);
[row, i]=find(err_opt==min(err_opt));

%% Testing ulang
y_train=net{i}(u1);
y_testing=net{i}(u2);

%% Prediction result (normalized output in the range [-1, 1]
Z1=([y_testing(1,:);y2(1,:)])';  % SCP
%Z2=([y_testing(2,:);y2(2,:)])';  % COP

%% Generate function
%generate function for the optimization.
genFunction(net{i})
% generate (neural_function.m)
%% plotting SCP or COP