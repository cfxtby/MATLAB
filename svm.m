a=load('svm.data');
data=a(:,1:256);
group=a(:,263);
test=data(1:1593/2,:);
group1=group(1:1593/2);
group2=group(1593/2:1593);
Sample=data(1593/2:1593,:);
%SVMStruct=svmtrain(test,group1,'kernel_function' , 'rbf', 'rbf_sigma',1);
