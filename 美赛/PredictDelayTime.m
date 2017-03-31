function Delay =PredictDelayTime( cars,mu,lumta,B )

m=length(cars);
Delay=zeros(m,1);

for i=1:m
    Delay(i)=1/mu*ceil(i/B)-(i-1)/lumta;
end
end

