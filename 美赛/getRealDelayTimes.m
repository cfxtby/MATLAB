function RealDelay = getRealDelayTimes( cars,mu,B)
%cars����Ϊ����ĳЩ�������ʱ��
%muΪ���������ʱ���ֵ,BΪ�շ�վ��Ŀ
%����ֵΪÿ����������ʱ��
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