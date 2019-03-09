function visualizeBoundaryLinear(X,y,model)
SVs_idx=model.sv_indices;%֧����������

alpha_SVs=model.sv_coef;%ʵ���Ͼ���a_i*y_i

%֧������
x_SVs=X(SVs_idx,:);
y_SVs=y(SVs_idx);

w=sum(diag(alpha_SVs)*x_SVs);
b=-model.rho;

xp=linspace(min(X(:,1)),max(X(:,1)),100);
yp=-(w(1)*xp+b)/w(2);

yp1=-(w(1)*xp+b+1)/w(2);
yp2=-(w(1)*xp+b-1)/w(2);

plotData(X,y);
hold on;
plot(xp,yp,'-b');
hold off
end