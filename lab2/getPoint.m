function [x,y,x1,y1]=getPoint()
%��ȡ����x��yΪѵ��������x1��y1Ϊ��������
a=load('data1.txt');
x=[a(1:200,:);a(500:699,:)];
y=x(:,1559);
x=x(:,1:1558)';
x1=[a(401:600,:)];
 y1=x1(:,1559);
x1=x1(:,1:1558)';
end