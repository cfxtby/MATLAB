a=xlsread('train1.csv','b2:ae1461');
b1=xlsread('train1.csv','a1462:ad2920');
%RMS1=RMS;
[m1,n1]=size(b1);
order=b1(:,1);
x1=b1(:,2:n1);
a(isnan(a)==1)=2000;
x1(isnan(x1)==1)=2000;
[m,n]=size(a);
y=a(:,n);
x=a(:,1:n-1);
[base,allE]=PCA(x(1:1200,:));
[a,b]=size(base);
tmp=zeros(0,b);
for i=1:m
    tmp=[tmp;(x(i,:)-allE)*base];
end
%tmp=X1;
%x=Y1;
m2=1200;
%[bestacc,bestc,bestg] = SVMcg(y(1:m2),tmp(1:m2,:),0.00001,10,-100,100,2,1,1,0.9)
%cmd = ['-s 3 -t 2',' -c ',num2str(bestc),' -g ',num2str(bestg)];
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), cmd);
model = libsvmtrain(y(1:m2),tmp(1:m2,:), '-s 3 -t 0 -h 0');
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), '-s 2 -t 2 -g 0.000001');
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), '-t 0 -c 10');
%model=svmtrain(x,y,'kernel_function' , 'polynomial', 'polyorder' ,5);
%利用建立的模型看其在训练集合上的回归效果
%[py,accuracy,mse] = libsvmpredict(y(1:m1,:),x(1:m1,:),model);
[py1,accuracy1,mse1] = libsvmpredict(y(1:m2),tmp(1:m2,:),model);
[py,accuracy,mse] = libsvmpredict(y(m2+1:m),tmp(m2+1:m,:),model);
RMS=sqrt(sum((py-y(m2+1:m)).^2)/length(py))
%c=[order,py];
%csvwrite('output.csv',c);
%%
%toc