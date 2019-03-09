function visualizeSupportVectors(X,y,model)
SVs_idx=model.sv_indices;

x_SVs=X(SVs_idx,:);
y_SVs=y(SVs_idx);

pos=find(y_SVs==1);neg=find(y_SVs==0);
plotData(X,y);
hold on;

plot(x_SVs(pos,1),x_SVs(pos,2),'r+','LineWidth', 1, 'MarkerSize', 7)
hold on;
plot(x_SVs(neg,1),x_SVs(neg,2),'bo','MarkerFaceColor', 'b', 'MarkerSize', 7)
hold off;
end