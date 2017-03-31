function [y1,t]=mul1(x,y,n)
%不加惩罚项的最小二乘法拟合
%其中x为自变量，y为因变量，n为拟合曲线阶数
X=ones(size(x,1),1);
for i=1:n 
   X=[x.^i,X];
end
w=(X'*X)\X'*y;
t=[0:0.01:2*pi];
y1=polyval(w,t);
hold off;
plot(x,y,'.');hold on;
plot(t,sin(t)*5+5,'g');
plot(t,y1,'r');hold off;

end
%使用了未加惩罚项的最小二乘法来进行求解，传入参数n为维度，x为自变量x的列向量，y为已有的样本y

