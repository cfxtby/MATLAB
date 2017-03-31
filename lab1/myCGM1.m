%共轭梯度法求二次凸函数的最小值(FR法)
%此代码不适用于求一般函数的最小值
function [minf,xk]=myCGM1(x,y,n)

X=ones(size(x,1),1);
for i=1:n 
   X=[x.^i,X];
end
A=X'*X;
x0=zeros(n+1,1);%初始点
g0=2*X'*(X*x0-y);
mu=1;%最小误差
if g0'*g0<mu
    minf=subs(f,[x1;x2],x0);%函数的最小值
    return;
end
d0=-g0;%搜索方向
alpha=-(g0'*d0)/(d0'*A*d0);%步长
xk=x0+alpha*d0;%下一点
gk=2*X'*(X*xk-y);%梯度值
beta=gk'*gk/(g0'*g0);%求搜索方向时的系数
dk=-gk+beta*d0;%下一个方向
x0=xk;%更新点
g0=gk;%更新所在点的梯度
d0=dk;%更新方向
while g0'*g0>mu
    alpha=-(g0'*d0)/(d0'*A*d0);%步长
    xk=x0+alpha*d0;%下一点
    gk=2*X'*(X*xk-y);%梯度值
    beta=gk'*gk/(g0'*g0);%求搜索方向时的系数
    dk=-gk+beta*d0;%下一搜索方向
    x0=xk;%更新点
    g0=gk;%更新所在点的梯度
    d0=dk;%更新方向
    g0'*g0
end
minf=subs(f,[x1;x2],xk);%函数的最小值
end