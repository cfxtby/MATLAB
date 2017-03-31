a=load('svm.data');                 %��ȡ��������
data=a(:,1:256);                    %ȡ��������
group=a(:,263);                     %ȡ��6�ŵı�ǩ
test=data(1:1593/2,:);              %��ȡǰһ����Ϊѵ������
group1=group(1:1593/2);             %��ȡѵ����ǩ
group2=group(1593/2:1593);          %��ȡ��һ����Ϊ��������
Sample=data(1593/2:1593,:);         %��ȡ��һ��ı�ǩ
tmp=20;

p=zeros(tmp,1);                     %׼���洢ÿ�ε���ȷ��
for i=1:tmp                         %����ѭ����ͨ��ѭ�����ҺõĲ���
    SVMStruct=svmtrain(test,group1,'kernel_function' , 'rbf', 'rbf_sigma',i);   %ʹ�����õ�SVM����ѵ����ʹ�õ���RBF�ˣ�����sigmaΪi

    Group = svmclassify(SVMStruct,Sample);     %ʹ��ѵ���ĵõ������ݽ��ж��ڲ����������в���
    p(i)=sum(Group==group2)/length(group2);     %���ѵ�����Ե���ȷ��
    disp(sum(Group==group2)/length(group2));
end
disp('���Ƿָ���-------------------------------------------------------------');
plot([1:1:tmp],p);
hold on;
for i=1:tmp-10    %ѭ���������٣���Ļ��ᷢ�ֳ�����
    SVMStruct=svmtrain(test,group1,'kernel_function' , 'polynomial', 'polyorder' ,i);
    Group = svmclassify(SVMStruct,Sample);
    p(i)=sum(Group==group2)/length(group2);
    disp(sum(Group==group2)/length(group2));
end
plot([1:1:tmp-10],p(1:tmp-10),'r');
hold off;
axis([0 i+10 0.8 1]);