function w=myNewTon1(x,y,sigm)
%获取仅有两个特征的数据作为测试
positive = find(y == 1);%positives
negative = find(y == 0);%negatives

plot(x(1,positive), x(2,positive),'r+');
hold on;
plot(x(1,negative), x(2,negative),'go');
legend('Admitted','Not Admitted');


[m,n]=size(x);
m=m+1;
w=zeros(m,1);
x=[x;ones(1,n)];
h=1./(1+exp(w'*x));
w1=ones(m,1);
loss1=(sum(y.*log(h')+(1-y).*log(1-h')));
H=zeros(m,m);
k=0;
loss=1;
while abs(loss1-loss)>0.00000001 && k<3000
    loss=loss1;
    k=k+1;
    for i=1:m
        w1(i)=1/n*((x(i,:)*(y-h'))+sigm*w(i));
        for j=1:m
            H(i,j)=sum(h.*(1-h).*x(i,:).*x(j,:),2)/n;
        end 
    end
    H=sigm*eye(m)+H;
    w=w-pinv(H)*w1;
    h=1./(1+exp(w'*x));
    loss1=-1/n*(sum(y.*log(h')+(1-y).*log(1-h')));
    
end


hold on;
x_axis = x(1,:);
y_axis = (-w(3).*x(3,:) - w(1).*x(1,:))/w(2);
plot(x_axis, y_axis,'-');
legend('Training Data','Linear regression');
hold off;
end