function [y1,t]=mul1(x,y,n)
%���ӳͷ������С���˷����
%����xΪ�Ա�����yΪ�������nΪ������߽���
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
%ʹ����δ�ӳͷ������С���˷���������⣬�������nΪά�ȣ�xΪ�Ա���x����������yΪ���е�����y

