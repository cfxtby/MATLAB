function y=toone(x)
[m,n]=size(x);
y=ones(m,n);
for i=1:n
    mx=max(x(:,i));
    mn=min(x(:,i));
    y(:,i)=(x(:,i)-mn)/(mx-mn)*100;
end
return ;