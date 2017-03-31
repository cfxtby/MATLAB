function [x,y]=getPoint4(m,n)
%获取x1，x2并不条件独立的数据
x=zeros(m,n);
for i=1:m
    for j=1:n
        x(i,j)=randn();
    end
end
y1=ones(1,m);
y=zeros(n,1);
x(2,:)=x(1,:)+x(2,:);
y2=y1*x;
for i=1:length(y2)
    if y2(i)>0
        y(i)=1;
    else y(i)=0;
    end
end
hold off;

for i=1:n
    if y(i)==1
        plot(x(1,i),x(2,i),'r*');
        hold on;
    else
        plot(x(1,i),x(2,i),'b*');
        hold on;
    end    
end
end