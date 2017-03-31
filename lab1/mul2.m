function y1 = mul2(x,y,n,sigm)
%MUL2 带有惩罚项的最小二乘法进行拟合
%   x为自变量，y为因变量，n为拟合曲线的阶数，sigm为惩罚项参数

X=ones(length(x),1);
for i=1:n
    X=[x.^i,X];
end
w=(X'*X+sigm*eye(n+1))\X'*y;
t=[0:0.01:2*pi];
y1=polyval(w,t);
plot(t,y1,'r');
hold on;
plot(x,y,'.');
plot(t,sin(t)*5+5,'g');
hold off;
end