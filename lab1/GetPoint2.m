x=[0:1:10];
x=x';
y1=zeros(1,11);
for i=1:length(x)
    y1(1,i)=rand()-0.5;
end
y=0.04*x.^2-0.4*x+2+y1';
plot(x,y,'.');