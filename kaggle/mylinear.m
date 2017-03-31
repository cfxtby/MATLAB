stepwise(x,y);

[beta,r,j] = nlinfit(tmp(1:m2,:),y(1:m2,:),'model',1);
x2=tmp(m2+1:m,:);
[y1,delta] = nlpredci('model',x2,beta,r,j);


%%
for i=0
    [b,bint,r,rint,statsl] = regress(y(1:m2,:),tmp(1:m2,:),i);
    x2=tmp(m2+1:m,:);
    y1=x2*b;
    sqrt(sum((y1-y(m2+1:m,:)).^2)/length(y1))
end 
%%