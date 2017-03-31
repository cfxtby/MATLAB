function [cars,lumta1]=getCarsAndlumta(lumta,time)
cars=zeros(0,1);
lumta1=zeros(0,1);
delay=0;
t=0;
i=1;
while delay<=24
    while t<time
        x=exprnd(lumta(i));
        t=t+x;
        delay=delay+x;
        lumta1=[lumta1;lumta(i)];
        cars=[cars;delay];
    end
    i=i+1;
    t=0;
end
end