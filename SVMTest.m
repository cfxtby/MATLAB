a=load('svm.data');                 %读取数据样本
data=a(:,1:256);                    %取出特征量
group=a(:,263);                     %取出6号的标签
test=data(1:1593/2,:);              %获取前一半作为训练样本
group1=group(1:1593/2);             %获取训练标签
group2=group(1593/2:1593);          %获取后一半作为测试样本
Sample=data(1593/2:1593,:);         %获取后一半的标签
tmp=20;

p=zeros(tmp,1);                     %准备存储每次的正确率
for i=1:tmp                         %进行循环，通过循环查找好的参数
    SVMStruct=svmtrain(test,group1,'kernel_function' , 'rbf', 'rbf_sigma',i);   %使用内置的SVM进行训练，使用的是RBF核，参数sigma为i

    Group = svmclassify(SVMStruct,Sample);     %使用训练的得到的数据进行对于测试样本进行测试
    p(i)=sum(Group==group2)/length(group2);     %求出训练测试的正确率
    disp(sum(Group==group2)/length(group2));
end
disp('我是分割线-------------------------------------------------------------');
plot([1:1:tmp],p);
hold on;
for i=1:tmp-10    %循环次数较少，多的话会发现出问题
    SVMStruct=svmtrain(test,group1,'kernel_function' , 'polynomial', 'polyorder' ,i);
    Group = svmclassify(SVMStruct,Sample);
    p(i)=sum(Group==group2)/length(group2);
    disp(sum(Group==group2)/length(group2));
end
plot([1:1:tmp-10],p(1:tmp-10),'r');
hold off;
axis([0 i+10 0.8 1]);