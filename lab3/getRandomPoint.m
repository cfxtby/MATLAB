function y = getRandomPoint( evl,d,n)
%�����ֵ�ͷ�����һ������������Ϊn��Ϊ�þ�ֵevl�ͷ���d����̬�ֲ�
y=zeros(1,n);
for i=1:n
    y(i)=randn() * sqrt(d) + evl;
end
end

