a=xlsread('train3.csv','b2:ca1461');
b1=xlsread('test3.csv','a2:bz1460');
%RMS1=RMS;
[m1,n1]=size(b1);
order=b1(:,1);
x1=b1(:,2:n1);
[m,n]=size(a);
y=a(:,n);
x=a(:,1:n-1);
x4=[x;x1];
x4=toone(x4);
tooney=y;
[y,mx,mn]=tooney1(tooney);

%x=a(:,1:n-1);
%[base,allE]=PCA(x(1:1200,:));
%[a,b]=size(base);
%tmp=zeros(0,b);
%for i=1:m
 %   tmp=[tmp;(x(i,:)-allE)*base];
%end
%tmp=X1;
%x=Y1;
%num2str(10^4*5*((1+10)/20*2-8.5+11)), ' -g ', num2str(10^(-6)*5*(11+(0+10)/20*2-8.5))
%[10240000,4.00000000000000e-07]
 
%cmd = ['-c ',num2str((10+1)*10^4), ' -g ',num2str((10*1+1)*10^-6) , ' -s 3 -p 1 -n 0.1'];
cmd = ['-c ', num2str(10^5*100), ' -g ', num2str(10^-5) , ' -s 3 -p 1'];
m2=1200;
%[bestacc,bestc,bestg] = SVMcg(y(1:m2),tmp(1:m2,:),0.00001,10,-100,100,2,1,1,0.9)
%cmd = ['-s 3 -t 2',' -c ',num2str(bestc),' -g ',num2str(bestg)];
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), cmd);

model = libsvmtrain(y(1:m2),x4(1:m2,:), cmd);

model1 = libsvmtrain(y(1:m),x4(1:m,:), cmd);
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), '-s 2 -t 2 -g 0.000001');
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), '-t 0 -c 10');
%model=svmtrain(x,y,'kernel_function' , 'polynomial', 'polyorder' ,5);
%利用建立的模型看其在训练集合上的回归效果
[py2,accuracy2,mse] = libsvmpredict(order,x4(m+1:m+m1,:),model1);
[py,accuracy,mse] = libsvmpredict(y(1:m2,:),x4(1:m2,:),model);
[py1,accuracy1,mse1] = libsvmpredict(y(m2+1:m),x4(1+m2:m,:),model);
%[py,accuracy,mse] = libsvmpredict(y(m2+1:m),tmp(m2+1:m,:),model);
RMS=sqrt(sum((py-y(1:m2,:)).^2)/length(py))
RMS=sqrt(sum((py1-y(m2+1:m,:)).^2)/length(py1))
%c=[order,py];
%csvwrite('output.csv',c);
py2=py2/100*(mx-mn)+mn;
c=[order,py2];
csvwrite('outputSvm.csv',c);
%%
%toc