function w=slim(x,y,sigm)
[m,n]=size(x);
w=ones(m,1)*0;
w1=zeros(m,1);
for j=1:100000
    for i=1:n
        a=exp(w'*x(:,i));
        w1=w1+1/(1+a)*x(:,i);
    end
    w1=x*y-w1;%获得一阶导数
    w=w+sigm*w1;
end
t=[-3:0.01:3];
y1=-(w(3)+w(1)*t)/w(2);

for i=1:n
    if y(i)==1
    plot(x(1,i),x(2,i),'r*');
    hold on;
    else
        plot(x(1,i),x(2,i),'b*');
        hold on;
    end    
end
axis([-3 3 -3 3]);
plot(t,y1,'g');hold off;
end