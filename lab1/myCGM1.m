%�����ݶȷ������͹��������Сֵ(FR��)
%�˴��벻��������һ�㺯������Сֵ
function [minf,xk]=myCGM1(x,y,n)

X=ones(size(x,1),1);
for i=1:n 
   X=[x.^i,X];
end
A=X'*X;
x0=zeros(n+1,1);%��ʼ��
g0=2*X'*(X*x0-y);
mu=1;%��С���
if g0'*g0<mu
    minf=subs(f,[x1;x2],x0);%��������Сֵ
    return;
end
d0=-g0;%��������
alpha=-(g0'*d0)/(d0'*A*d0);%����
xk=x0+alpha*d0;%��һ��
gk=2*X'*(X*xk-y);%�ݶ�ֵ
beta=gk'*gk/(g0'*g0);%����������ʱ��ϵ��
dk=-gk+beta*d0;%��һ������
x0=xk;%���µ�
g0=gk;%�������ڵ���ݶ�
d0=dk;%���·���
while g0'*g0>mu
    alpha=-(g0'*d0)/(d0'*A*d0);%����
    xk=x0+alpha*d0;%��һ��
    gk=2*X'*(X*xk-y);%�ݶ�ֵ
    beta=gk'*gk/(g0'*g0);%����������ʱ��ϵ��
    dk=-gk+beta*d0;%��һ��������
    x0=xk;%���µ�
    g0=gk;%�������ڵ���ݶ�
    d0=dk;%���·���
    g0'*g0
end
minf=subs(f,[x1;x2],xk);%��������Сֵ
end