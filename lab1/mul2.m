function y1 = mul2(x,y,n,sigm)
%MUL2 ���гͷ������С���˷��������
%   xΪ�Ա�����yΪ�������nΪ������ߵĽ�����sigmΪ�ͷ������

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