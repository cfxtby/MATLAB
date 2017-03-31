function w=myNewTon(x,y,x1,y1,sigm)

%x，y为训练样本
%x1,y1为测试样本
%sigm为惩罚项系数


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
y2=w'*[x1;ones(1,length(y1))];
while abs(loss1-loss)>0.00000001 && k<10
    loss=loss1;
    k=k+1;
    for i=1:m
        w1(i)=1/n*((x(i,:)*(y-h'))+sigm*w(i));
        for j=1:m
            H(i,j)=sum(h.*(1-h).*x(i,:).*x(j,:),2)/n;
        end 
    end
    H=H+sigm*eye(m);
    w=w-pinv(H)*w1;
    h=1./(1+exp(w'*x));
    loss1=-1/n*(sum(y.*log(h')+(1-y).*log(1-h')));
    
end
y2=w'*[x1;ones(1,length(y1))];
t=0;
for i=1:size(x1,2)
    if (y1(i)==1 && y2(i)<0)||(y1(i)==0 && y2(i)>0)
        t=t+1;
    end
end
disp(t/size(x1,2));

end