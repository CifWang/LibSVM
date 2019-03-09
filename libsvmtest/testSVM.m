clear; close all; clc
load('ex6data1.mat');

plotData(X,y);
pause;

model1=libsvmtrain(y,X,'-t 0');
model2=libsvmtrain(y,X,'-t 2');

visualizeBoundaryLinear(X,y,model1);
pause;
visualizeSupportVectors(X,y,model1);
pause;

visualizeBoundary(X,y,model2);
pause;
visualizeSupportVectors(X,y,model2);
pause;

load('ex6data2.mat');
plotData(X,y);
