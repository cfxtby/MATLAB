function FR1(x,y,n,sigm);

%共轭梯度法
%x为自变量，y为因变量，n为拟合曲线的阶数，sigm为惩罚项参数
X=ones(size(x,1),1);
for i=1:n 
   X=[x.^i,X];
end
A=X'*X+sigm*eye(n+1);b=X'*y;
w=ones(n+1,1);
r=b-A*w;p=r;rsold=r'*r;
    for i=1:100%2*length(b)
        Ap=A*p;
        alpha=rsold/(p'*Ap);
        w=w+alpha*p;
        r=r-alpha*Ap;
        rsnew=r'*r;
        if sqrt(rsnew)<1e-10
              break;
        end
        p=r+(rsnew/rsold)*p;
        rsold=rsnew;
    end
t=[0:0.01:10];
y1=polyval(w,t);
plot(t,y1,'r');
axis([0 2*pi 0 5]);
hold on;
plot(x,y,'.');
plot(t,sin(t)+2,'g');
%plot(t,0.04*t.^2-0.4*t+2,'g');
hold off;
end