function [C, gamma,Accuracy,maxaccuracy,index] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%C = 1;
%sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Parameter=zeros(8,1);
Parameter(1)=0.01;Parameter(2)=0.03;Parameter(3)=0.1;Parameter(4)=0.3;
Parameter(5)=1;Parameter(6)=3;Parameter(7)=10;Parameter(8)=30;

X1=X(:,1);X2=X(:,2);

Accuracy=zeros(64,1);
Accuracy_index=1;

errors=zeros(64,1);
error_index=1;

for i=1:8
    sigma=Parameter(i);
    gamma=1/(2*sigma^2);
    model1=libsvmtrain(y,X,'-c 0.01 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model1);
    Accuracy(Accuracy_index)=accuracy(1);
    model2=libsvmtrain(y,X,'-c 0.03 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model2);
    Accuracy(Accuracy_index+1)=accuracy(1);
    model3=libsvmtrain(y,X,'-c 0.1 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model3);
    Accuracy(Accuracy_index+2)=accuracy(1);
    model4=libsvmtrain(y,X,'-c 0.3 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model4);
    Accuracy(Accuracy_index+3)=accuracy(1);
    model5=libsvmtrain(y,X,'-c 1 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model5);
    Accuracy(Accuracy_index+4)=accuracy(1);
    model6=libsvmtrain(y,X,'-c 3 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model6);
    Accuracy(Accuracy_index+5)=accuracy(1);
    model7=libsvmtrain(y,X,'-c 10 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model7);
    Accuracy(Accuracy_index+6)=accuracy(1);
    model8=libsvmtrain(y,X,'-c 30 -g gamma -t 2');
    [~,accuracy,~]=libsvmpredict(yval,Xval,model8);
    Accuracy(Accuracy_index+7)=accuracy(1);
    Accuracy_index=Accuracy_index+8;
end


[maxaccuracy,index]=max(Accuracy);
indexsigma=floor(index/8)+1;
indexc=mod(index,8);

C=Parameter(indexc);
sigma=Parameter(indexsigma);
gamma=1/(2*sigma^2);





% =========================================================================

end
