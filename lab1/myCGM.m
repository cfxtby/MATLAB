%�����ݶȷ������͹��������Сֵ(FR��)
%�˴��벻��������һ�㺯������Сֵ
function [minf,xk]=myCGM
syms x1 x2;
f=x1+x2;%�������ʽ
A=[4 2;2 2];%����A��Ϊ���溯���Ķ������еĲ���A
x0=[0 0]';%��ʼ��
mu=1;%��С���
gradf=gradient(f);%�������ݶ�
g0=subs(gradf,[x1;x2],x0);%�ڵ�x0�����ݶ�ֵ
if g0'*g0<mu
    minf=subs(f,[x1;x2],x0);%��������Сֵ
    return;
end
d0=-g0;%��������
alpha=-(g0'*d0)/(d0'*A*d0);%����
xk=x0+alpha*d0;%��һ��
gk=subs(gradf,[x1;x2],xk);%�ݶ�ֵ
beta=gk'*gk/(g0'*g0);%����������ʱ��ϵ��
dk=-gk+beta*d0;%��һ������
x0=xk;%���µ�
g0=gk;%�������ڵ���ݶ�
d0=dk;%���·���
while g0'*g0>mu
    alpha=-(g0'*d0)/(d0'*A*d0);%����
    xk=x0+alpha*d0;%��һ��
    gk=subs(gradf,[x1;x2],xk);%�ݶ�ֵ
    beta=gk'*gk/(g0'*g0);%����������ʱ��ϵ��
    dk=-gk+beta*d0;%��һ��������
    x0=xk;%���µ�
    g0=gk;%�������ڵ���ݶ�
    d0=dk;%���·���
end
minf=subs(f,[x1;x2],xk);%��������Сֵ
end