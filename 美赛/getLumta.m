function cars = getLumta(lumta,time)
%����lumtaΪһ�����������ȸ��������ж�
%timeΪʱ���������������������п������ɳ�����ʻ���
thisTime=0;
size=length(lumta);
t=1;
cars=zeros(1,0);
while t<=size
    if t<=size & thisTime<time*t
        a=thisTime+exprnd(lumta(t));
        thisTime=a;
        cars=[cars,a];
    else 
        t=t+1;
    end
end

