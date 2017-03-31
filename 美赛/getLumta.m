function cars = getLumta(lumta,time)
%输入lumta为一个向量，长度根据输入判断
%time为时间间隔，根据这个间隔来进行考虑生成车辆行驶情况
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

