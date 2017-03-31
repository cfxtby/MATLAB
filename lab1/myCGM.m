%共轭梯度法求二次凸函数的最小值(FR法)
%此代码不适用于求一般函数的最小值
function [minf,xk]=myCGM
syms x1 x2;
f=x1+x2;%函数表达式
A=[4 2;2 2];%矩阵A即为上面函数的二次型中的参数A
x0=[0 0]';%初始点
mu=1;%最小误差
gradf=gradient(f);%函数的梯度
g0=subs(gradf,[x1;x2],x0);%在点x0处的梯度值
if g0'*g0<mu
    minf=subs(f,[x1;x2],x0);%函数的最小值
    return;
end
d0=-g0;%搜索方向
alpha=-(g0'*d0)/(d0'*A*d0);%步长
xk=x0+alpha*d0;%下一点
gk=subs(gradf,[x1;x2],xk);%梯度值
beta=gk'*gk/(g0'*g0);%求搜索方向时的系数
dk=-gk+beta*d0;%下一个方向
x0=xk;%更新点
g0=gk;%更新所在点的梯度
d0=dk;%更新方向
while g0'*g0>mu
    alpha=-(g0'*d0)/(d0'*A*d0);%步长
    xk=x0+alpha*d0;%下一点
    gk=subs(gradf,[x1;x2],xk);%梯度值
    beta=gk'*gk/(g0'*g0);%求搜索方向时的系数
    dk=-gk+beta*d0;%下一搜索方向
    x0=xk;%更新点
    g0=gk;%更新所在点的梯度
    d0=dk;%更新方向
end
minf=subs(f,[x1;x2],xk);%函数的最小值
end