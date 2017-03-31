function  [DelayMean1,DelayMean2]= QueueSimulation()
% 进行排队模型的仿真测试 to test the simulation of Queue Model
% change the mu and lumta to test
lumta=[100:100:300];
mu=[50:50:150];
B=[8:2:12];
n=10000;
DelayMean1=zeros(0,6);
DelayMean2=zeros(0,5);
for i=1:3
    for j=1:3
        for k=1:3
            cars = getCars(1/lumta(i),n);
            RealDelay = getRealDelayTimes( cars,1/mu(j),B(k));
            means=mean(RealDelay);
            a=[lumta(i),mu(j),B(k),1/mu(j),means,abs(means-1/mu(j))/mu(j)];
            DelayMean1=[DelayMean1;a];
        end
    end 
end


lumta=[600:100:800];
mu=[50:20:90];
B=[4:1:6];
n=10000;
for i=1:3
    for j=1:3
        for k=1:3
            cars = getCars(1/lumta(i),n);
            RealDelay = getRealDelayTimes( cars,1/mu(j),B(k));
            Delay =PredictDelayTime( cars,mu(j),lumta(i),B(k) );
            Rms=(mean((RealDelay-Delay).^2))^0.5;
            Cc=corrcoef([RealDelay,Delay]);
            a1=[lumta(i),mu(j),B(k),Rms,Cc(1,2)];
            DelayMean2=[DelayMean2;a1];
        end
    end
end
csvwrite('QueueSim1.csv',DelayMean1);
csvwrite('QueueSim2.csv',DelayMean2);
end

