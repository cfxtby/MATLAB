function RealDelay = getRealDelayTimes( cars,mu,B)
%cars输入为按照某些车到达的时间
%mu为处理的延误时间均值,B为收费站数目
%返回值为每辆车的延误时间
m=length(cars);
RealDelay=zeros(m,1);
Btime=zeros(B,1);
t=0;
for i=1:m
    [ma,I]=min(Btime);
    delay=exprnd(mu);
    if Btime(I)>cars(i);
        RealDelay(i)=Btime(I)-cars(i)+delay;
        Btime(I)=Btime(I)+delay;
        t=t+1;
    else
        Btime(I)=delay+cars(i);
        RealDelay(i)=delay;
    end
end
%hold off;plot([1:1:20000],[1:1:20000]*(1/11*2-1/10),'b-');hold on;plot([1:1:20000],RealDelay,'r-');
%t