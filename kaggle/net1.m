%Ĭ��ѵ���㷨 ѡ�����trainlm������
net = feedforwardnet([32 16 8]);
%net = newff( minmax(tmp') , [8 1] , { 'logsig' 'tansig' } , 'traingd' ) ; 
m2=1200;
Xtrain=x4(1:m2,:);
Xtrain=Xtrain';
Ytrain=y(1:m2,:);
Ytrain=Ytrain';
%ѵ��������ģ�͡�


%����ѵ������
net.trainparam.show = 500 ;
net.trainparam.epochs = 10000 ;
net.trainparam.goal = 0.0000001 ;
net.trainParam.lr = 0.0000000001 ;
[net,tr] = train(net,Xtrain,Ytrain);

%������2007-2008���������Ϊѵ�����ݣ����������
yn = net(Xtrain);
perf = perform(net,yn,Ytrain);  %MSE  587.5126 0.02488
MAPE = mean(abs(yn-Ytrain)./Ytrain);
RMS1=sqrt(mean((yn-Ytrain).^2));
clear yn perf MAPE;
Xtest=x4(m2+1:1460,:);
% ��������2009��Ĳ��Լ����� Xtest ����Ԥ��
yn = net(Xtest');
RMS=sqrt(mean((yn-(y(m2+1:m,:))').^2));
%plotperform(tr);
%c=[order,yn];
%csvwrite('outputNet.csv',c);
%view(net);
%clear perf yn;