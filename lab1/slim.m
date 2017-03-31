function [ t,y1 ] = slim( x,y,n,leng,sigm)
%使用梯度下降法进行处理，
%x为输入的x轴变量，y为与之对应的因变量，
%n为拟合曲线阶数，leng为步长，sigm为惩罚项参数
X=ones(size(x,1),1);
for i=1:n 
   X=[x.^i,X];
end
w2=11;
w=ones(n+1,1)*0.0001;
k=0;
while true
    k=k+1;
    w1=(2*X'*(X*w-y)+sigm*w);
    w2=(X*w-y)'*(X*w-y);
    w=w-leng*w1;
    if w2<0.1 || k>100000000
        break;
    end
end
t=[0:0.01:10];
y1=polyval(w,t);
plot(t,y1,'r');
hold on;
plot(x,y,'.');
plot(t,sin(t)+2,'g');
%plot(t,0.04*t.^2-0.4*t+2,'g');
axis([0 2*pi 0 5]);
hold off;
end