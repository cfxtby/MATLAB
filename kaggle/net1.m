%默认训练算法 选择的是trainlm函数。
net = feedforwardnet([32 16 8]);
%net = newff( minmax(tmp') , [8 1] , { 'logsig' 'tansig' } , 'traingd' ) ; 
m2=1200;
Xtrain=x4(1:m2,:);
Xtrain=Xtrain';
Ytrain=y(1:m2,:);
Ytrain=Ytrain';
%训练神经网络模型。


%设置训练参数
net.trainparam.show = 500 ;
net.trainparam.epochs = 10000 ;
net.trainparam.goal = 0.0000001 ;
net.trainParam.lr = 0.0000000001 ;
[net,tr] = train(net,Xtrain,Ytrain);

%我们用2007-2008年的数据作为训练数据，计算其误差
yn = net(Xtrain);
perf = perform(net,yn,Ytrain);  %MSE  587.5126 0.02488
MAPE = mean(abs(yn-Ytrain)./Ytrain);
RMS1=sqrt(mean((yn-Ytrain).^2));
clear yn perf MAPE;
Xtest=x4(m2+1:1460,:);
% 接下来对2009年的测试集，即 Xtest 进行预测
yn = net(Xtest');
RMS=sqrt(mean((yn-(y(m2+1:m,:))').^2));
%plotperform(tr);
%c=[order,yn];
%csvwrite('outputNet.csv',c);
%view(net);
%clear perf yn;