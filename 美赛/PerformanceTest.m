lumtaM=[34	29	12	23	27	60	47	111	160	101	142	136	153	150	174	180	167	127	126	58	66	65	92	55];
lumtaM=lumtaM*3*(0.832);
B=1;
mu=70;
x=[1:0.25:24.75];
this=0.832;
yi= interp1([1:1:25],[lumtaM,34],x,'spline'); 
[cars,lumta1]=getCarsAndlumta(1./yi,0.25);
B=4;
m=length(cars);
mu=70;%70
delay=zeros(m,1);
for i= 1:m
    if B*mu<1/lumta1(i)
        if i==1
            delay(i)=1/mu;
        else
            delay(i)=delay(i-1)+1/B/mu-lumta1(i);
        end
    else if i==1
            delay(i)=1/mu;
        elseif delay(i-1)+1/B/mu-lumta1(i)<1/mu
            delay(i)=1/mu;
        else
            delay(i)=delay(i-1)+1/B/mu-lumta1(i);
        end
    end
end
plotyy([1:1:m],delay,[1:1:m],1./lumta1);
hold on;
plot([1:1:m],ones(m,1)*420,'r');
mean(delay)
1/mu
hold off;

